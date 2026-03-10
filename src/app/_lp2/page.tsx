import type { Metadata } from 'next'

export const metadata: Metadata = {
    title: 'WFIX Tech | LP2 Preview – Especialistas em Dispositivos',
    description: 'Preview da landing page com seções de depoimentos, processo e FAQ.',
}

export default function LP2Page() {
    const depoimentos = [
        { nome: "Carlos M.", eq: "MacBook Pro", nota: 5, texto: "Trouxe meu notebook com tela quebrada. Em 2 dias estava novo. Nota 10!" },
        { nome: "Fernanda S.", eq: "iPhone 14", nota: 5, texto: "Bateria trocada em 1 hora. Preço justo e atendimento excelente." },
        { nome: "Ricardo L.", eq: "PC Gamer", nota: 5, texto: "Minha placa de vídeo parou. A WFIX diagnosticou e resolveu no mesmo dia." },
    ]

    const faqs = [
        { q: "Quanto tempo leva o reparo?", a: "O diagnóstico leva até 24h. Reparos simples ficam prontos no mesmo dia ou no dia seguinte." },
        { q: "Vocês dão garantia?", a: "Sim! Todos os serviços têm 6 meses de garantia documentada no termo de entrada." },
        { q: "Posso acompanhar o processo?", a: "Sim. Você recebe atualizações automáticas via WhatsApp em cada etapa." },
        { q: "Atendem em domicílio?", a: "Para clientes corporativos e alguns serviços de rede, sim. Consulte disponibilidade." },
    ]

    return (
        <div className="min-h-screen bg-slate-950 text-slate-400" style={{ fontFamily: "'Inter', sans-serif" }}>

            {/* NAV sticky */}
            <nav className="sticky top-0 z-50 bg-slate-950/80 backdrop-blur-xl border-b border-white/5">
                <div className="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">
                    <div className="flex items-center gap-2">
                        <div className="w-7 h-7 bg-gradient-to-br from-[#3EE07A] to-emerald-600 rounded-lg flex items-center justify-center shadow-lg shadow-[#3EE07A]/20">
                            <svg className="w-4 h-4 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M13 10V3L4 14h7v7l9-11h-7z" /></svg>
                        </div>
                        <span className="font-black text-white text-lg tracking-tighter">
                            WFIX <span className="text-[#3EE07A]">Tech</span>
                        </span>
                    </div>
                    <div className="hidden md:flex items-center gap-6 text-xs font-semibold">
                        <a href="#servicos" className="text-slate-400 hover:text-white transition-colors">Serviços</a>
                        <a href="#processo" className="text-slate-400 hover:text-white transition-colors">Como Funciona</a>
                        <a href="#depoimentos" className="text-slate-400 hover:text-white transition-colors">Avaliações</a>
                        <a href="#contato" className="bg-[#3EE07A] text-slate-950 px-5 py-2 rounded-xl font-bold hover:opacity-90 transition-opacity shadow-lg shadow-[#3EE07A]/20">
                            Orçamento Grátis
                        </a>
                    </div>
                    <div className="md:hidden flex items-center gap-1.5">
                        <span className="w-2 h-2 rounded-full bg-[#3EE07A] animate-pulse" />
                        <span className="text-[10px] text-slate-500 font-bold uppercase tracking-wider">Online</span>
                    </div>
                </div>
            </nav>

            {/* HERO */}
            <section className="relative overflow-hidden pt-20 pb-32">
                {/* BG glow */}
                <div className="absolute top-0 left-1/2 -translate-x-1/2 w-[800px] h-[600px] bg-[#3EE07A]/8 blur-[130px] rounded-full pointer-events-none" />
                <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_top,rgba(62,224,122,0.05)_0%,transparent_60%)] pointer-events-none" />

                <div className="max-w-6xl mx-auto px-6 relative z-10">
                    {/* Pill badge */}
                    <div className="flex justify-center mb-8">
                        <div className="inline-flex items-center gap-2 px-4 py-1.5 bg-[#3EE07A]/10 border border-[#3EE07A]/20 rounded-full">
                            <span className="w-1.5 h-1.5 rounded-full bg-[#3EE07A] animate-pulse" />
                            <span className="text-[11px] font-bold text-[#3EE07A] uppercase tracking-widest">+500 equipamentos recuperados</span>
                        </div>
                    </div>

                    <h1 className="text-center text-4xl md:text-6xl lg:text-7xl font-black text-white tracking-tighter leading-[1.05] mb-8">
                        Seu equipamento em<br />
                        mãos de{" "}
                        <span className="bg-gradient-to-r from-[#3EE07A] to-emerald-400 bg-clip-text text-transparent">especialistas.</span>
                    </h1>

                    <p className="text-center text-slate-400 text-xl max-w-2xl mx-auto mb-12 leading-relaxed">
                        Diagnóstico preciso, reparo com garantia e atualização em tempo real. Transparência de ponta a ponta.
                    </p>

                    <div className="flex flex-col sm:flex-row gap-4 justify-center">
                        <a href="#contato" className="bg-[#3EE07A] text-slate-950 px-8 py-4 rounded-2xl font-bold text-lg hover:opacity-90 transition-all hover:scale-105 text-center shadow-[0_8px_30px_rgba(62,224,122,0.3)]">
                            Solicitar Diagnóstico Grátis
                        </a>
                        <a href="#depoimentos" className="border border-white/10 text-white px-8 py-4 rounded-2xl font-semibold text-lg hover:bg-white/5 transition-colors text-center">
                            Ver Avaliações ↓
                        </a>
                    </div>

                    {/* Stats */}
                    <div className="mt-20 grid grid-cols-2 md:grid-cols-4 gap-6">
                        {[
                            { num: "500+", label: "Equipamentos Recuperados" },
                            { num: "4.9★", label: "Avaliação Média Google" },
                            { num: "24h", label: "Diagnóstico" },
                            { num: "6m", label: "Garantia em Tudo" },
                        ].map(s => (
                            <div key={s.label} className="bg-white/[0.03] border border-white/5 rounded-2xl p-6 text-center backdrop-blur-sm">
                                <p className="text-3xl font-black text-white mb-1">{s.num}</p>
                                <p className="text-xs text-slate-500">{s.label}</p>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* SERVIÇOS */}
            <section id="servicos" className="py-24 bg-slate-900/40 border-y border-white/5">
                <div className="max-w-6xl mx-auto px-6">
                    <div className="text-center mb-16">
                        <p className="text-[#3EE07A] text-xs font-bold uppercase tracking-widest mb-2">O que fazemos</p>
                        <h2 className="text-3xl md:text-4xl font-black text-white tracking-tight">Nossas Especialidades</h2>
                    </div>

                    <div className="grid md:grid-cols-3 gap-6">
                        {[
                            {
                                color: "from-emerald-500/10 to-transparent border-emerald-500/20",
                                iconColor: "text-emerald-400",
                                title: "Hardware & PCs",
                                items: ["Troca de SSD/HD", "Limpeza profissional", "Reparo de placa-mãe", "Upgrade de memória"],
                            },
                            {
                                color: "from-[#3EE07A]/10 to-transparent border-[#3EE07A]/20",
                                iconColor: "text-[#3EE07A]",
                                title: "Notebooks",
                                items: ["Troca de tela", "Reparo de bateria", "Substituição de teclado", "Diagnóstico completo"],
                            },
                            {
                                color: "from-cyan-500/10 to-transparent border-cyan-500/20",
                                iconColor: "text-cyan-400",
                                title: "Rede & TI",
                                items: ["Infraestrutura Wi-Fi", "Configuração de roteadores", "Gestão de equipamentos", "Atendimento empresarial"],
                            },
                        ].map(s => (
                            <div key={s.title} className={`p-8 rounded-3xl bg-gradient-to-b ${s.color} border relative overflow-hidden group hover:scale-[1.02] transition-transform duration-300`}>
                                <h3 className={`font-black text-xl text-white mb-6 ${s.iconColor}`}>{s.title}</h3>
                                <ul className="space-y-3">
                                    {s.items.map(item => (
                                        <li key={item} className="flex items-center gap-3 text-sm text-slate-300">
                                            <svg className={`w-4 h-4 ${s.iconColor} shrink-0`} fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M5 13l4 4L19 7" /></svg>
                                            {item}
                                        </li>
                                    ))}
                                </ul>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* PROCESSO */}
            <section id="processo" className="py-24">
                <div className="max-w-4xl mx-auto px-6">
                    <div className="text-center mb-16">
                        <p className="text-[#3EE07A] text-xs font-bold uppercase tracking-widest mb-2">Sem mistério</p>
                        <h2 className="text-3xl font-black text-white tracking-tight">Como funciona</h2>
                    </div>
                    <div className="space-y-4">
                        {[
                            { n: "1", title: "Você nos contata", desc: "Via WhatsApp ou formulário. Rápido e sem compromisso." },
                            { n: "2", title: "Diagnóstico em 24h", desc: "Avaliamos seu equipamento e enviamos o orçamento detalhado." },
                            { n: "3", title: "Aprova e a gente age", desc: "Só executamos após sua aprovação. Zero surpresas." },
                            { n: "4", title: "Equipamento entregue", desc: "Retirada com termo de garantia de 6 meses." },
                        ].map((step, i) => (
                            <div key={step.n} className="flex items-start gap-6 p-6 bg-white/[0.02] border border-white/5 rounded-2xl hover:border-[#3EE07A]/20 transition-colors group">
                                <div className="w-12 h-12 rounded-2xl bg-[#3EE07A]/10 border border-[#3EE07A]/20 flex items-center justify-center shrink-0 group-hover:bg-[#3EE07A]/20 transition-colors">
                                    <span className="font-black text-[#3EE07A]">{step.n}</span>
                                </div>
                                <div>
                                    <h4 className="font-bold text-white mb-1">{step.title}</h4>
                                    <p className="text-sm text-slate-500">{step.desc}</p>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* DEPOIMENTOS */}
            <section id="depoimentos" className="py-24 bg-slate-900/40 border-y border-white/5">
                <div className="max-w-6xl mx-auto px-6">
                    <div className="text-center mb-16">
                        <p className="text-[#3EE07A] text-xs font-bold uppercase tracking-widest mb-2">Avaliações reais</p>
                        <h2 className="text-3xl font-black text-white tracking-tight">O que nossos clientes dizem</h2>
                    </div>
                    <div className="grid md:grid-cols-3 gap-6">
                        {depoimentos.map(d => (
                            <div key={d.nome} className="p-6 bg-white/[0.03] border border-white/5 rounded-3xl hover:border-[#3EE07A]/20 transition-colors">
                                <div className="flex gap-1 mb-4">
                                    {Array.from({ length: 5 }).map((_, i) => (
                                        <svg key={i} className="w-4 h-4 text-amber-400" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87L18.18 22 12 18.56 5.82 22 7 14.14 2 9.27l6.91-1.01L12 2z" /></svg>
                                    ))}
                                </div>
                                <p className="text-slate-300 text-sm mb-5 leading-relaxed">"{d.texto}"</p>
                                <div className="flex items-center gap-3 pt-4 border-t border-white/5">
                                    <div className="w-8 h-8 rounded-full bg-[#3EE07A]/20 flex items-center justify-center">
                                        <span className="text-[#3EE07A] text-xs font-bold">{d.nome.charAt(0)}</span>
                                    </div>
                                    <div>
                                        <p className="text-white text-xs font-bold">{d.nome}</p>
                                        <p className="text-slate-600 text-[10px]">{d.eq}</p>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* FAQ */}
            <section className="py-24">
                <div className="max-w-3xl mx-auto px-6">
                    <div className="text-center mb-16">
                        <h2 className="text-3xl font-black text-white tracking-tight">Dúvidas Frequentes</h2>
                    </div>
                    <div className="space-y-3">
                        {faqs.map(faq => (
                            <details key={faq.q} className="group bg-white/[0.02] border border-white/5 rounded-2xl p-6 open:border-[#3EE07A]/20 transition-colors cursor-pointer">
                                <summary className="font-semibold text-white list-none flex items-center justify-between">
                                    {faq.q}
                                    <svg className="w-4 h-4 text-slate-500 group-open:text-[#3EE07A] transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" /></svg>
                                </summary>
                                <p className="mt-4 text-sm text-slate-400 leading-relaxed">{faq.a}</p>
                            </details>
                        ))}
                    </div>
                </div>
            </section>

            {/* CTA */}
            <section id="contato" className="py-24 bg-gradient-to-b from-[#3EE07A]/5 to-transparent border-t border-[#3EE07A]/10">
                <div className="max-w-3xl mx-auto px-6 text-center">
                    <h2 className="text-4xl font-black text-white tracking-tight mb-4">
                        Pronto para recuperar seu equipamento?
                    </h2>
                    <p className="text-slate-400 text-lg mb-12">
                        Fale agora com a nossa equipe. Atendimento em minutos.
                    </p>
                    <a
                        href="https://wa.me/5511999999999"
                        className="inline-flex items-center gap-3 bg-[#25D366] text-white px-10 py-5 rounded-2xl font-black uppercase tracking-widest text-lg shadow-[0_8px_40px_rgba(37,211,102,0.3)] hover:scale-105 transition-transform duration-300"
                    >
                        <svg className="w-7 h-7" fill="currentColor" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" /></svg>
                        Chamar no WhatsApp
                    </a>
                </div>
            </section>

            {/* FOOTER */}
            <footer className="py-10 border-t border-white/5 text-center">
                <p className="text-[10px] font-bold uppercase tracking-[0.5em] text-slate-700">
                    © 2026 WFIX Tech · Todos os direitos reservados
                </p>
                <p className="text-[9px] text-slate-800 mt-2">Preview LP2 – Depoimentos + FAQ</p>
            </footer>

            {/* WhatsApp flutuante */}
            <a href="https://wa.me/5511999999999" className="fixed bottom-8 right-8 w-14 h-14 bg-[#25D366] text-white rounded-full flex items-center justify-center shadow-2xl z-[100] hover:scale-110 transition-transform duration-300">
                <svg className="w-7 h-7" fill="currentColor" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" /></svg>
            </a>
        </div>
    )
}
