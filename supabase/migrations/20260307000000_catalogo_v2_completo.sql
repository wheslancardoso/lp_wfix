-- ============================================================
-- Migration: Catálogo de Serviços v2 — Completo (17 serviços)
-- ============================================================
-- Recria o catálogo completo da WFIX Tech.
-- Mantém UUIDs dos serviços existentes para preservar referências.
-- Adiciona serviços novos de Notebook e PC.
-- ============================================================

-- PASSO 1: Limpar tudo (ON DELETE SET NULL cuida das FKs)
DELETE FROM public.service_catalog;

-- PASSO 2: Inserir catálogo completo (17 serviços)
INSERT INTO public.service_catalog
  (id, tenant_id, name, description, category, preco_base, aplica_multiplicador, active)
VALUES

  -- ============================================================
  -- DIAGNÓSTICO (1 serviço)
  -- ============================================================
  ('0b5f2253-7e4c-4ef8-acad-eadfa1583c21', '8132d666-06c0-46a7-b362-a30393be96c0',
   'Visita Técnica / Diagnóstico',
   'Identificação da causa raiz com análise técnica do equipamento. Inclui deslocamento e hora técnica. Valor abatido caso o serviço seja aprovado.',
   'Diagnóstico', 120.00, FALSE, TRUE),

  -- ============================================================
  -- COMPUTADORES (7 serviços)
  -- ============================================================
  ('5235b915-9b51-4e3b-a15a-d97296d76fe7', '8132d666-06c0-46a7-b362-a30393be96c0',
   'Formatação',
   'Instalação limpa do sistema operacional, drivers atualizados, aplicativos essenciais e otimização geral do sistema.',
   'Computadores', 180.00, TRUE, TRUE),

  ('e03ce976-1ef8-4131-a101-3857659bc0a6', '8132d666-06c0-46a7-b362-a30393be96c0',
   'Formatação + Backup Completo',
   'Backup seguro dos arquivos do usuário, formatação com sistema otimizado e restauração dos dados.',
   'Computadores', 250.00, TRUE, TRUE),

  ('91408342-7d1d-4ff8-b37b-71e1b095212d', '8132d666-06c0-46a7-b362-a30393be96c0',
   'Limpeza Técnica Profunda',
   'Desmontagem do equipamento, remoção de poeira, higienização técnica de componentes, lubrificação de cooler e troca de pasta térmica. Inclui testes térmicos.',
   'Computadores', 200.00, TRUE, TRUE),

  ('e6ed4a8d-c9a5-43e5-b751-fd91ac683799', '8132d666-06c0-46a7-b362-a30393be96c0',
   'Formatação + Limpeza Combo',
   'Formatação completa com sistema otimizado + limpeza técnica com troca de pasta térmica. O pacote mais pedido.',
   'Computadores', 300.00, TRUE, TRUE),

  ('bed3ab6e-ad51-49a9-b033-33d32b45af4a', '8132d666-06c0-46a7-b362-a30393be96c0',
   'Upgrade de Hardware',
   'Instalação de componentes como SSD, memória RAM ou placa de vídeo. Inclui testes de funcionamento.',
   'Computadores', 150.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Troca de Fonte',
   'Substituição da fonte de alimentação com organização de cabos e testes de estabilidade.',
   'Computadores', 150.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Montagem de Computador',
   'Montagem completa de computador com instalação de componentes, organização de cabos e testes de funcionamento.',
   'Computadores', 300.00, TRUE, TRUE),

  -- ============================================================
  -- NOTEBOOKS (7 serviços)
  -- ============================================================
  ('dc28bf2a-315e-4912-acf1-4c453b9e37a2', '8132d666-06c0-46a7-b362-a30393be96c0',
   'Troca de Componente (Notebook)',
   'Substituição de peças internas como SSD, memória ou cooler. Inclui desmontagem técnica e testes.',
   'Notebooks', 180.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Troca de Tela (Notebook)',
   'Substituição do display do notebook com desmontagem da tampa e testes de imagem.',
   'Notebooks', 220.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Troca de Teclado (Notebook)',
   'Substituição de teclado com desmontagem do equipamento e testes de funcionamento.',
   'Notebooks', 180.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Troca de Teclado Estrutural (Notebook)',
   'Substituição de teclado rebitado na carcaça (comum em IdeaPad e similares). Exige desmontagem completa e fixação estrutural.',
   'Notebooks', 280.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Troca de Bateria (Notebook)',
   'Substituição da bateria interna ou externa do notebook com testes de carga e funcionamento.',
   'Notebooks', 150.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Reparo de Carcaça (Notebook)',
   'Recuperação estrutural da carcaça do notebook incluindo alinhamento e reforço interno.',
   'Notebooks', 250.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Reparo de Dobradiça (Notebook)',
   'Reparo ou substituição do sistema de dobradiça com reforço estrutural da tampa.',
   'Notebooks', 250.00, TRUE, TRUE),

  -- ============================================================
  -- IMPRESSORAS (2 serviços — agrupados para IA)
  -- ============================================================
  ('97d66c00-c719-4514-ac7e-71afb3d9caf6', '8132d666-06c0-46a7-b362-a30393be96c0',
   'Manutenção de Impressora (Jato de Tinta)',
   'Diagnóstico completo, desobstrução de cabeça de impressão, limpeza de roletes, reset de contadores e testes de qualidade. Cobre Epson EcoTank, Canon e HP Ink Tank.',
   'Impressoras', 260.00, TRUE, TRUE),

  ('68459977-7e1e-4c56-9426-2c9dfddefc3d', '8132d666-06c0-46a7-b362-a30393be96c0',
   'Manutenção de Impressora (Laser)',
   'Limpeza interna, lubrificação de fusor, verificação de cilindro e testes de qualidade de impressão. Cobre Brother, Samsung e HP LaserJet.',
   'Impressoras', 280.00, TRUE, TRUE);

-- ============================================================
-- RESULTADO:
-- 17 serviços ativos no catálogo:
--   1 diagnóstico | 7 computadores | 7 notebooks | 2 impressoras
--
-- Para consultar os IDs dos novos serviços:
-- SELECT id, name, category, preco_base FROM service_catalog ORDER BY category, name;
-- ============================================================
