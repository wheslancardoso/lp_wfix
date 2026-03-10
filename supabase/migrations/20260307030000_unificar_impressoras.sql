-- ============================================================
-- Migration: Unifica serviços de impressora no catálogo
-- ============================================================
-- PROBLEMA: Existem 3 serviços de impressora com preços diferentes.
-- A IA do n8n não consegue distinguir entre eles de forma consistente,
-- causando preços diferentes para o mesmo problema.
--
-- SOLUÇÃO: Unificar em 2 serviços:
-- 1. Manutenção de Impressora (Jato de Tinta) → R$ 250
-- 2. Manutenção de Impressora (Laser) → R$ 280
-- ============================================================

-- PASSO 1: Inativar os 3 serviços antigos de impressora
UPDATE public.service_catalog
SET active = FALSE
WHERE category = 'Impressoras'
  AND active = TRUE;

-- PASSO 2: Inserir os 2 novos serviços unificados
INSERT INTO public.service_catalog
  (id, tenant_id, name, description, category, preco_base, aplica_multiplicador, active)
VALUES
  -- Jato de Tinta (Epson, Canon, HP)
  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Manutenção de Impressora (Jato de Tinta)',
   'Diagnóstico completo, desobstrução de cabeça de impressão, limpeza de pickup roller, reset de contadores e testes de qualidade. Cobre Epson EcoTank, Canon e HP Ink Tank.',
   'Impressoras', 250.00, TRUE, TRUE),

  -- Laser (Brother, Samsung, HP LaserJet)
  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Manutenção de Impressora (Laser)',
   'Diagnóstico completo, lubrificação de fusor, avaliação de cilindro e laser scanner, limpeza interna e testes de qualidade. Cobre Brother, Samsung e HP LaserJet.',
   'Impressoras', 280.00, TRUE, TRUE);

-- ============================================================
-- RESULTADO:
-- Os 3 antigos ficam inativos (histórico preservado).
-- 2 novos serviços ativos: Jato de Tinta (R$250) e Laser (R$280).
--
-- APÓS RODAR:
-- Copie os novos UUIDs gerados e atualize o prompt do n8n
-- com os IDs corretos na seção [CATÁLOGO DE SERVIÇOS].
--
-- Para consultar os novos IDs:
-- SELECT id, name, preco_base FROM service_catalog
-- WHERE category = 'Impressoras' AND active = TRUE;
-- ============================================================
