-- Migration para adicionar a coluna `ia_ativa` na tabela `customers`
-- O valor padrão será TRUE para manter o comportamento normal e permitir desativar por cliente.

ALTER TABLE public.customers
ADD COLUMN IF NOT EXISTS ia_ativa BOOLEAN NOT NULL DEFAULT TRUE;

-- Opcional: Adicionar comentário na coluna para fins de documentação
COMMENT ON COLUMN public.customers.ia_ativa IS 'Sinalizador para o n8n saber se o envio automático de IA está liberado (true) ou pausado (false) para este cliente.';
