-- ============================================================
-- Migration: Função RPC para limpeza de dados n8n por telefone
-- ============================================================
-- Problema: As tabelas do n8n (n8n_chat_histories, atendimentos_ativos,
-- controle_interrupcao) têm RLS ativado. O Supabase client do app
-- não tem permissão de DELETE nessas tabelas.
--
-- Solução: Criar uma função SECURITY DEFINER que roda como
-- superuser e pode deletar independente de RLS.
-- ============================================================

CREATE OR REPLACE FUNCTION public.fn_cleanup_n8n_by_phone(p_phone TEXT)
RETURNS VOID AS $$
DECLARE
    v_phone TEXT;
BEGIN
    -- Remove tudo que não é dígito
    v_phone := regexp_replace(p_phone, '[^0-9]', '', 'g');

    IF v_phone IS NULL OR v_phone = '' THEN
        RETURN;
    END IF;

    -- 1. Limpa memória da IA (histórico de conversa)
    DELETE FROM public.n8n_chat_histories
    WHERE session_id = v_phone;

    -- 2. Limpa orçamentos travados
    DELETE FROM public.atendimentos_ativos
    WHERE session_id = v_phone;

    -- 3. Limpa controle de interrupção
    DELETE FROM public.controle_interrupcao
    WHERE numero_cliente = v_phone;

    RAISE NOTICE 'Limpeza n8n concluída para telefone: %', v_phone;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION public.fn_cleanup_n8n_by_phone(TEXT) IS
'Limpa dados do n8n (chat_histories, atendimentos_ativos, controle_interrupcao) pelo telefone do cliente. Usa SECURITY DEFINER para bypassar RLS.';
