import { createClient } from '@supabase/supabase-js'
import * as dotenv from 'dotenv'
import { resolve } from 'path'

// Carrega as variáveis de ambiente dos arquivos .env.local e .env
dotenv.config({ path: resolve(process.cwd(), '.env.local') })
dotenv.config({ path: resolve(process.cwd(), '.env') })

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL || ''
const SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || ''

if (!SUPABASE_URL || !SERVICE_KEY) {
    console.error('Faltam as credenciais do Supabase nas variáveis de ambiente.')
    process.exit(1)
}

const supabase = createClient(SUPABASE_URL, SERVICE_KEY, {
    auth: { autoRefreshToken: false, persistSession: false }
})

async function run() {
    const { data, error } = await supabase
        .from('orders')
        .select('status, id, customer_id')
        .eq('id', '2963822e-92e4-4141-bb91-18b1230636a2')
        .single()

    if (error) {
        console.error('Erro ao buscar pedido:', error)
        return
    }
    console.log('ORDER STATUS:', data)
}
run()
