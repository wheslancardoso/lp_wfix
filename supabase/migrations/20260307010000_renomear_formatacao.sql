-- ============================================================
-- Migration: Renomeia "Formatação + Otimização" para "Formatação"
-- ============================================================
-- A otimização já é parte do processo padrão de formatação.
-- Manter o nome separado confundia a IA e o catálogo.
-- ============================================================

UPDATE public.service_catalog
SET name = 'Formatação',
    description = 'Instalação de imagem limpa, drivers atualizados, apps essenciais e otimização completa. Equipamento devolvido pronto para uso.'
WHERE name = 'Formatação + Otimização'
  AND active = TRUE;

-- ============================================================
-- RESULTADO:
-- "Formatação + Otimização" → "Formatação"
-- Preço base mantido: R$ 180
-- "Formatação + Backup" continua em R$ 250 (para backups maiores)
-- ============================================================
