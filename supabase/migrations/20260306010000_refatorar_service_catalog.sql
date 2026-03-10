-- ============================================================
-- Migration: Refatorar tabela service_catalog para nova
-- arquitetura de precificação (VERSÃO SEGURA - NÃO DESTRUTIVA)
-- ============================================================
-- INSTRUÇÕES:
-- 1. NÃO usa TRUNCATE — preserva todos os serviços existentes
-- 2. Serviços antigos são INATIVADOS (active = false), não deletados
-- 3. UUID do tenant Wheslan (WFIX) está fixo — NÃO depende de LIMIT 1
-- 4. Colunas antigas (price_min, price_max, estimated_time) SÃO REMOVIDAS.
-- ============================================================

-- PASSO 1: Dropar colunas antigas e Adicionar novas (se ainda não existirem)
ALTER TABLE public.service_catalog
  DROP COLUMN IF EXISTS price_min,
  DROP COLUMN IF EXISTS price_max,
  DROP COLUMN IF EXISTS estimated_time;

ALTER TABLE public.service_catalog
  ADD COLUMN IF NOT EXISTS preco_base NUMERIC(10,2) NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS aplica_multiplicador BOOLEAN NOT NULL DEFAULT TRUE;

COMMENT ON COLUMN public.service_catalog.preco_base IS 'Preço base do serviço para equipamentos Tier 1 (risco comum). Já inclui os R$120 da visita/diagnóstico quando aplicável.';
COMMENT ON COLUMN public.service_catalog.aplica_multiplicador IS 'Se TRUE, o preço será multiplicado pelo fator de risco do equipamento (Tier). Se FALSE, o preço é fixo (ex: visita técnica).';

-- PASSO 2: Inativar serviços antigos do tenant WFIX (sem deletar)
-- Isso preserva o histórico e evita erros de FK.
UPDATE public.service_catalog
SET active = false
WHERE tenant_id = '8132d666-06c0-46a7-b362-a30393be96c0'
  AND preco_base = 0;  -- Só inativa os que NÃO foram migrados ainda

-- PASSO 3: Inserir os 10 novos serviços com preço base definido
-- (usa ON CONFLICT para não duplicar caso o script rode mais de uma vez)
INSERT INTO public.service_catalog (id, tenant_id, name, description, category, preco_base, aplica_multiplicador, active) VALUES
  -- COMPUTADORES
  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Formatação + Otimização',
   'Instalação de imagem limpa com Macrium Reflect, drivers atualizados, apps essenciais e otimização de BIOS/inicialização. Equipamento devolvido pronto para uso.',
   'Computadores', 180.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Formatação + Backup Completo',
   'Triagem completa de arquivos do usuário, backup seguro em nuvem/físico, formatação com imagem otimizada e restauração dos dados na estrutura original.',
   'Computadores', 250.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Limpeza Técnica Profunda',
   'Desmontagem completa, higienização química de placa, lubrificação de cooler e troca de Pasta Térmica (Silver) de alta condutividade. Inclui organização de cabos.',
   'Computadores', 180.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Upgrade de Hardware / Montagem',
   'Instalação física de componentes (SSD/RAM/GPU), cable management, otimização de BIOS e testes de stress pós-instalação.',
   'Computadores', 150.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Formatação + Limpeza Combo',
   'Formatação completa com imagem otimizada + desmontagem/higienização/pasta térmica. O pacote mais pedido — máquina como nova.',
   'Computadores', 300.00, TRUE, TRUE),

  -- IMPRESSORAS
  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Manutenção Preventiva (Impressora)',
   'Limpeza de roletes, sensores e ajustes preventivos. Verificação de funcionamento geral e calibração de cabeça.',
   'Impressoras', 200.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Reparo Mecânico (Impressora)',
   'Intervenção na unidade de limpeza (wiper pad), bomba, engrenagens e encoder strip. Inclui lubrificação e ajuste de mecanismos.',
   'Impressoras', 280.00, TRUE, TRUE),

  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Desobstrução / Reset (Impressora)',
   'Solução química para cabeça de impressão + pressurização pneumática + reset lógico de contador de almofada. Máxima tentativa de recuperação.',
   'Impressoras', 250.00, TRUE, TRUE),

  -- DIAGNÓSTICO
  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Visita Técnica / Diagnóstico',
   'Deslocamento técnico até o local e hora técnica para identificação da causa raiz. Valor abatido caso o serviço principal seja aprovado.',
   'Diagnóstico', 120.00, FALSE, TRUE),

  -- NOTEBOOK
  (gen_random_uuid(), '8132d666-06c0-46a7-b362-a30393be96c0',
   'Troca de Componente (Notebook)',
   'Substituição de peça específica (bateria, tela, teclado, conector DC, dobradiça). Inclui desmontagem técnica e testes pós-reparo.',
   'Notebooks', 180.00, TRUE, TRUE);

-- ============================================================
-- RESULTADO ESPERADO:
-- - 10 novos serviços ATIVOS com preco_base definido
-- - Serviços antigos INATIVOS (preservados para histórico)
-- - Colunas price_min, price_max e estimated_time REMOVIDAS.
-- ============================================================
