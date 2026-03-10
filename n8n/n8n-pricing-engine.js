// ============================================================
// WFIX Tech — Motor de Precificação Determinístico (n8n Code Node)
// ============================================================
// Cole este código inteiro num nó "Code" do n8n.
//
// INPUT esperado (vindo do AI Agent ou nó anterior):
// {
//   "service_id": "uuid-do-servico",
//   "tier": 2,
//   "preco_base": 180,
//   "aplica_multiplicador": true,
//   "commercial_description": "...",
//   "difficulty_reasoning": "..."
// }
//
// OUTPUT gerado:
// {
//   "preco_tabela": 270,   ← Preço âncora (orçamento que o cliente vê)
//   "preco_pix": 240,      ← "Carta na manga" para fechar no Pix
//   "tier": 2,
//   "multiplicador": 1.3,
//   "valor_real": 234,
//   "service_id": "...",
//   "commercial_description": "...",
//   "difficulty_reasoning": "..."
// }
// ============================================================

const TIER_MULTIPLIERS = {
    1: 1.0,   // PCs de escritório, notebooks padrão, Epson EcoTank
    2: 1.3,   // PCs Gamer, Notebooks Premium (Avell, Alienware, Legion)
    3: 1.7,   // Apple (MacBook, iMac), Ultrabooks selados
};

const GORDURA_MARGEM = 0.15; // 15% de margem para negociação

// ------ Processar cada item do batch ------
const results = [];

for (const item of $input.all()) {
    const data = item.json;

    const precoBase = Number(data.preco_base) || 0;
    const tier = Math.min(Math.max(Math.round(Number(data.tier) || 1), 1), 3);
    const aplicaMultiplicador = data.aplica_multiplicador !== false;

    const multiplicador = aplicaMultiplicador ? (TIER_MULTIPLIERS[tier] || 1.0) : 1.0;
    const valorReal = precoBase * multiplicador;
    const precoComGordura = valorReal * (1 + GORDURA_MARGEM);

    // Arredondamento psicológico: 
    // Tabela: sempre para a dezena superior
    const precoTabela = Math.ceil(precoComGordura / 10) * 10;
    // PIX (Carta na manga): arredonda para a vintena superior para proteger margem
    const precoPix = Math.ceil(valorReal / 20) * 20;

    results.push({
        json: {
            service_id: data.service_id || null,
            tier,
            multiplicador,
            valor_real: Math.round(valorReal * 100) / 100,
            preco_tabela: precoTabela,
            preco_pix: precoPix,
            commercial_description: data.commercial_description || '',
            difficulty_reasoning: data.difficulty_reasoning || '',
        }
    });
}

return results;
