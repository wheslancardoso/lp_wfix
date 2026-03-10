-- ============================================================
-- Migration: Upgrade de controle da IA (Status Bot & Modo Shadow)
-- ============================================================
-- Substitui a antiga coluna booleana 'ia_ativa' por 'status_bot'.
-- Por haver uma View com dependência, fazemos o drop da view,
-- a modificação da tabela e recriamos a view atualizada.
-- ============================================================

-- 0. Dropar a view que depende da coluna antiga
DROP VIEW IF EXISTS public.vw_atendimento_contexto;

-- 1. Cria os metadados de status e expiração
ALTER TABLE public.customers
ADD COLUMN IF NOT EXISTS status_bot TEXT NOT NULL DEFAULT 'ativo' CHECK (status_bot IN ('ativo', 'pausado', 'shadow')),
ADD COLUMN IF NOT EXISTS is_paused_until TIMESTAMPTZ;

-- 2. Migra os dados da coluna antiga (ia_ativa) pra não perder histórico de quem já estava pausado
UPDATE public.customers
SET status_bot = 'pausado'
WHERE ia_ativa = false;

-- 3. Remove com segurança a coluna antiga de booleano
ALTER TABLE public.customers
DROP COLUMN IF EXISTS ia_ativa;

-- 4. Documenta no banco de dados
COMMENT ON COLUMN public.customers.status_bot IS 'Estado atual do bot no n8n: ativo (IA responde ao cliente), pausado (IA silenciada) ou shadow (IA envia a sugestão para o telefone do admin).';
COMMENT ON COLUMN public.customers.is_paused_until IS 'Timestamp limite para retenção do estado shadow ou pausado. Se NOW() passar deste valor, o n8n deve resetar para ativo.';

-- 5. Recriar a view vw_atendimento_contexto (agora puxando o status_bot em vez do ia_ativa)
CREATE VIEW public.vw_atendimento_contexto AS
SELECT
  id as customer_id,
  name as cliente_nome,
  phone as cliente_telefone,
  status_bot as ia_ativa, -- Mantido com o nome 'ia_ativa' na view para não quebrar outros fluxos do n8n que já liam essa view, mas puxando da coluna nova.
  is_paused_until, -- Exportando também o timer
  (
    SELECT
      json_agg(hist.*) as json_agg
    FROM
      (
        SELECT
          o.display_id as os_numero,
          o.status,
          (
            (
              (COALESCE(e.type, ''::text) || ' '::text) || COALESCE(e.brand, ''::text)
            ) || ' '::text
          ) || COALESCE(e.model, ''::text) as equipamento,
          o.diagnosis_text as diagnostico,
          o.solution_text as solucao,
          to_char(o.created_at, 'DD/MM/YYYY'::text) as criado_em,
          to_char(o.finished_at, 'DD/MM/YYYY'::text) as finalizado_em,
          EXTRACT(
            day
            from
              now() - o.finished_at
          )::integer as dias_desde_finalizacao
        FROM
          orders o
          LEFT JOIN equipments e on e.id = o.equipment_id
        WHERE
          o.customer_id = c.id
        ORDER BY
          o.created_at desc
        LIMIT
          3
      ) hist
  ) as historico_recente
FROM
  customers c;
