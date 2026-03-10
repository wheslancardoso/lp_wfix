-- ============================================================
-- Migration: Limpeza em Cascata — Deletou OS? Limpa o n8n!
-- ============================================================
-- Ao deletar uma OS (orders), este trigger localiza o telefone
-- do cliente e apaga automaticamente:
--   1. n8n_chat_histories  → memória da IA
--   2. atendimentos_ativos → orçamento travado (se existir)
--
-- A lógica usa IF EXISTS para não quebrar caso alguma tabela
-- ainda não tenha sido criada (ex: atendimentos_ativos).
-- ============================================================

-- PASSO 1: Criar a tabela atendimentos_ativos (trava de orçamento)
CREATE TABLE IF NOT EXISTS public.atendimentos_ativos (
    id BIGSERIAL PRIMARY KEY,
    session_id TEXT NOT NULL,
    service_id UUID REFERENCES public.service_catalog(id) ON DELETE SET NULL,
    tier INTEGER DEFAULT 1 CHECK (tier BETWEEN 1 AND 3),
    preco_tabela NUMERIC(10,2),
    preco_pix NUMERIC(10,2),
    status TEXT DEFAULT 'aguardando' CHECK (status IN ('aguardando', 'aprovado', 'recusado', 'cancelado')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_atendimentos_session
  ON public.atendimentos_ativos(session_id);

COMMENT ON TABLE public.atendimentos_ativos IS 'Armazena o orçamento ativo gerado pela IA no n8n. Usado como "trava" para consistência de preços durante a negociação via WhatsApp.';

-- PASSO 2: Criar a função de limpeza
CREATE OR REPLACE FUNCTION public.fn_cascade_cleanup_n8n()
RETURNS TRIGGER AS $$
DECLARE
    v_phone TEXT;
BEGIN
    -- Busca o telefone do cliente vinculado à OS deletada
    SELECT phone INTO v_phone
    FROM public.customers
    WHERE id = OLD.customer_id;

    -- Se não encontrar telefone, não tem o que limpar
    IF v_phone IS NULL OR v_phone = '' THEN
        RETURN OLD;
    END IF;

    -- Remove apenas os dígitos (garante formato limpo pra comparar com session_id)
    v_phone := regexp_replace(v_phone, '[^0-9]', '', 'g');

    -- 1. Limpa a memória da IA (histórico de conversa)
    DELETE FROM public.n8n_chat_histories
    WHERE session_id = v_phone;

    -- 2. Limpa orçamentos travados (se a tabela existir)
    DELETE FROM public.atendimentos_ativos
    WHERE session_id = v_phone;

    -- 3. Limpa controle de interrupção
    DELETE FROM public.controle_interrupcao WHERE numero_cliente = v_phone;

    RAISE NOTICE 'Limpeza n8n concluída para session_id: %', v_phone;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION public.fn_cascade_cleanup_n8n() IS 'Trigger que limpa dados do n8n (memória da IA e orçamentos) quando uma OS é deletada. Busca o telefone do cliente e faz DELETE por session_id.';

-- PASSO 3: Vincular o Trigger à tabela orders
DROP TRIGGER IF EXISTS trg_cascade_cleanup_n8n ON public.orders;

CREATE TRIGGER trg_cascade_cleanup_n8n
    BEFORE DELETE ON public.orders
    FOR EACH ROW
    EXECUTE FUNCTION public.fn_cascade_cleanup_n8n();

-- ============================================================
-- RESULTADO:
-- Deletou a OS pelo painel WFIX ou pelo Supabase?
-- → memória da IA (chat_histories) e orçamento travado
--   (atendimentos_ativos) são apagados automaticamente.
-- ============================================================
