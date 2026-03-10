import type { Metadata } from 'next'

export const metadata: Metadata = {
    title: 'WFIX Tech | LP3 Preview – Assistência Técnica com Garantia',
    description: 'Preview da landing page com layout limpo, hero impactante e seção de preços/processo.',
}

export default function LP3Page() {
    return (
        <div className="min-h-screen bg-neutral-950 text-neutral-400" style={{ fontFamily: "'Inter', sans-serif" }}>

            {/* HERO de Impacto Máximo */}
            <section className="relative min-h-screen flex flex-col overflow-hidden">
                {/* BG + efeitos */}
                <div className="absolute inset-0 bg-gradient-to-br from-neutral-950 via-neutral-900 to-neutral-950" />
                <div className="absolute top-0 right-0 w-[700px] h-[700px] bg-[#3EE07A]/5 blur-[150px] rounded-full pointer-events-none" />
                <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-[#3EE07A]/3 blur-[120px] rounded-full pointer-events-none" />
                {/* Grade sutil */}
                <div className="absolute inset-0 bg-[linear-gradient(rgba(255,255,255,0.02)_1px,transparent_1px),linear-gradient(90deg,rgba(255,255,255,0.02)_1px,transparent_1px)] bg-[size:60px_60px] pointer-events-none" />

                {/* NAV */}
                <nav className="relative z-50 flex items-center justify-between max-w-7xl mx-auto w-full px-6 pt-8">
                    <div className="flex items-center gap-3">
                        <div className="relative">
                            <div className="w-10 h-10 bg-[#3EE07A] rounded-xl flex items-center justify-center shadow-[0_0_20px_rgba(62,224,122,0.4)]">
                                <svg className="w-5 h-5 text-neutral-950" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M13 10V3L4 14h7v7l9-11h-7z" /></svg>
                            </div>
                            <div className="absolute -top-1 -right-1 w-3 h-3 bg-[#3EE07A] rounded-full border-2 border-neutral-950 animate-pulse" />
                        </div>
                        <div>
                            <span className="font-black text-white text-xl tracking-tighter">WFIX</span>
                            <span className="font-light text-[#3EE07A] text-xl"> Tech</span>
                        </div>
                    </div>

                    <div className="hidden lg:flex items-center gap-8">
                        {["Serviços", "Processo", "Avaliações", "FAQ"].map(link => (
                            <a key={link} href={`#${link.toLowerCase()}`} className="text-sm text-neutral-400 hover:text-white font-medium transition-colors duration-200">
                                {link}
                            </a>
                        ))}
                        <a href="#contato" className="bg-[#3EE07A] text-neutral-950 px-6 py-2.5 rounded-full text-sm font-bold hover:shadow-[0_0_20px_rgba(62,224,122,0.5)] hover:scale-105 transition-all duration-300">
                            Falar Agora →
                        </a>
                    </div>

                    <div className="lg:hidden flex items-center gap-2">
                        <span className="w-2 h-2 rounded-full bg-[#3EE07A] animate-pulse" />
                        <span className="text-[10px] font-bold text-neutral-500 uppercase tracking-wider">Online</span>
                    </div>
                </nav>

                {/* HERO CONTENT */}
                <div className="relative z-10 flex-1 flex items-center max-w-7xl mx-auto w-full px-6 py-20">
                    <div className="max-w-4xl">
                        {/* Badge */}
                        <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-[#3EE07A]/10 border border-[#3EE07A]/20 mb-8">
                            <span className="flex h-2 w-2 relative">
                                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-[#3EE07A] opacity-75"></span>
                                <span className="relative inline-flex rounded-full h-2 w-2 bg-[#3EE07A]"></span>
                            </span>
                            <span className="text-[#3EE07A] text-xs font-bold uppercase tracking-widest">Diagnóstico em até 24 horas</span>
                        </div>

                        <h1 className="text-5xl md:text-7xl lg:text-[88px] font-black text-white leading-[0.95] tracking-tighter mb-8">
                            Equipamentos
                            <br />
                            <span className="relative">
                                <span className="relative z-10 text-transparent bg-clip-text bg-gradient-to-r from-[#3EE07A] to-emerald-300">Recuperados.</span>
                                <span className="absolute bottom-0 left-0 w-full h-[4px] bg-gradient-to-r from-[#3EE07A] to-emerald-300 rounded-full opacity-50" />
                            </span>
                            <br />
                            Garantia Real.
                        </h1>

                        <p className="text-neutral-400 text-xl md:text-2xl max-w-2xl leading-relaxed mb-12 font-light">
                            A <strong className="text-white font-semibold">WFIX Tech</strong> diagnostica, repara e entrega com garantia documentada — tudo em até 48h.
                        </p>

                        <div className="flex flex-wrap gap-4">
                            <a href="#contato" className="group inline-flex items-center gap-2 bg-[#3EE07A] text-neutral-950 px-8 py-4 rounded-2xl font-black text-lg shadow-[0_8px_40px_rgba(62,224,122,0.4)] hover:shadow-[0_12px_50px_rgba(62,224,122,0.6)] hover:scale-105 transition-all duration-300">
                                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" /></svg>
                                Orçamento Grátis
                            </a>
                            <a href="#servicos" className="inline-flex items-center gap-2 border border-white/10 text-white px-8 py-4 rounded-2xl font-semibold text-lg hover:bg-white/5 hover:border-white/20 transition-all duration-300">
                                Ver Serviços ↓
                            </a>
                        </div>

                        {/* Social proof */}
                        <div className="mt-14 flex items-center gap-6 flex-wrap">
                            <div className="flex items-center gap-3">
                                <div className="flex -space-x-2">
                                    {["C", "F", "R", "M"].map((l, i) => (
                                        <div key={i} className="w-8 h-8 rounded-full bg-gradient-to-br from-[#3EE07A]/40 to-emerald-700/40 border-2 border-neutral-950 flex items-center justify-center">
                                            <span className="text-[10px] font-bold text-[#3EE07A]">{l}</span>
                                        </div>
                                    ))}
                                </div>
                                <div>
                                    <div className="flex gap-0.5">
                                        {Array(5).fill(0).map((_, i) => (
                                            <svg key={i} className="w-3.5 h-3.5 text-amber-400" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87L18.18 22 12 18.56 5.82 22 7 14.14 2 9.27l6.91-1.01L12 2z" /></svg>
                                        ))}
                                    </div>
                                    <p className="text-[11px] text-neutral-500">+120 avaliações 5★</p>
                                </div>
                            </div>
                            <div className="h-8 w-px bg-white/10" />
                            <div className="flex items-center gap-2 text-sm text-neutral-500">
                                <svg className="w-4 h-4 text-[#3EE07A]" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" /></svg>
                                Garantia de 6 meses
                            </div>
                        </div>
                    </div>
                </div>

                {/* Bottom fade */}
                <div className="absolute bottom-0 inset-x-0 h-24 bg-gradient-to-t from-neutral-950 to-transparent pointer-events-none" />
            </section>

            {/* SERVIÇOS */}
            <section id="servicos" className="py-24 bg-neutral-950">
                <div className="max-w-7xl mx-auto px-6">
                    <div className="flex items-end justify-between mb-16 flex-wrap gap-6">
                        <div>
                            <p className="text-[#3EE07A] text-xs font-bold uppercase tracking-widest mb-2">Especialidades</p>
                            <h2 className="text-3xl md:text-4xl font-black text-white tracking-tight">O que resolvemos</h2>
                        </div>
                        <a href="#contato" className="text-sm text-[#3EE07A] font-semibold hover:underline">Ver todos os serviços →</a>
                    </div>

                    <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-4">
                        {[
                            { n: "01", title: "Hardware & PCs", icon: "M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z", desc: "Reparo, manutenção e upgrade de componentes de desktop e torre." },
                            { n: "02", title: "Notebooks", icon: "M12 18h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z", desc: "Tela, bateria, teclado, dobradiças. Todas as marcas." },
                            { n: "03", title: "Redes & Wi-Fi", icon: "M8.111 16.404a5.5 5.5 0 017.778 0M12 20h.01m-7.08-7.071c3.904-3.905 10.236-3.905 14.141 0M1.394 9.393c5.857-5.857 15.355-5.857 21.213 0", desc: "Infraestrutura de rede, Mesh corporativo e configurações avançadas." },
                            { n: "04", title: "Recuperação", icon: "M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4", desc: "Recuperação de dados em HDs, SSDs e pendrives danificados." },
                        ].map(s => (
                            <div key={s.n} className="group p-6 bg-white/[0.02] border border-white/5 rounded-3xl hover:border-[#3EE07A]/30 hover:bg-[#3EE07A]/[0.03] transition-all duration-300 cursor-pointer">
                                <div className="flex items-center justify-between mb-6">
                                    <span className="text-[10px] font-bold text-neutral-600 uppercase tracking-[0.2em]">{s.n}</span>
                                    <div className="w-9 h-9 rounded-xl bg-[#3EE07A]/10 border border-[#3EE07A]/20 flex items-center justify-center text-[#3EE07A] group-hover:bg-[#3EE07A] group-hover:text-neutral-950 transition-all duration-300">
                                        <svg className="w-4.5 h-4.5" style={{ width: "18px", height: "18px" }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d={s.icon} />
                                        </svg>
                                    </div>
                                </div>
                                <h3 className="font-bold text-white mb-2 text-lg">{s.title}</h3>
                                <p className="text-sm text-neutral-500 leading-relaxed">{s.desc}</p>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* PROCESSO VISUAL */}
            <section id="processo" className="py-24 bg-neutral-900/50 border-y border-white/[0.04]">
                <div className="max-w-6xl mx-auto px-6">
                    <div className="text-center mb-16">
                        <p className="text-[#3EE07A] text-xs font-bold uppercase tracking-widest mb-2">Sem complicação</p>
                        <h2 className="text-3xl font-black text-white tracking-tight">Simples assim</h2>
                    </div>

                    <div className="relative">
                        {/* Linha conectora */}
                        <div className="hidden md:block absolute top-8 left-[12.5%] right-[12.5%] h-px bg-gradient-to-r from-transparent via-[#3EE07A]/30 to-transparent" />

                        <div className="grid md:grid-cols-4 gap-8">
                            {[
                                { n: "1", emoji: "📲", title: "Fale conosco", desc: "WhatsApp ou formulário" },
                                { n: "2", emoji: "🔍", title: "Diagnóstico", desc: "Resultado em até 24h" },
                                { n: "3", emoji: "✅", title: "Aprova", desc: "Você decide antes de tudo" },
                                { n: "4", emoji: "🚀", title: "Entregue!", desc: "Com garantia documentada" },
                            ].map(step => (
                                <div key={step.n} className="text-center group">
                                    <div className="relative w-16 h-16 rounded-2xl bg-neutral-900 border border-white/5 flex items-center justify-center mx-auto mb-6 group-hover:border-[#3EE07A]/40 group-hover:shadow-[0_0_20px_rgba(62,224,122,0.1)] transition-all duration-300">
                                        <span className="text-2xl">{step.emoji}</span>
                                        <div className="absolute -top-2 -right-2 w-5 h-5 rounded-full bg-[#3EE07A] flex items-center justify-center">
                                            <span className="text-[9px] font-black text-neutral-950">{step.n}</span>
                                        </div>
                                    </div>
                                    <h4 className="font-bold text-white mb-1">{step.title}</h4>
                                    <p className="text-xs text-neutral-600">{step.desc}</p>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </section>

            {/* CTA FINAL */}
            <section id="contato" className="py-32 relative overflow-hidden">
                <div className="absolute inset-0 bg-gradient-to-br from-[#3EE07A]/8 via-neutral-950 to-neutral-950 pointer-events-none" />
                <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[300px] bg-[#3EE07A]/10 blur-[100px] rounded-full pointer-events-none" />

                <div className="max-w-4xl mx-auto px-6 text-center relative z-10">
                    <div className="inline-flex items-center gap-2 px-4 py-1.5 bg-[#3EE07A]/10 border border-[#3EE07A]/20 rounded-full mb-8">
                        <span className="w-1.5 h-1.5 rounded-full bg-[#3EE07A] animate-pulse" />
                        <span className="text-[#3EE07A] text-xs font-bold uppercase tracking-widest">Atendimento imediato</span>
                    </div>

                    <h2 className="text-4xl md:text-6xl font-black text-white tracking-tighter leading-tight mb-6">
                        Seu equipamento merece
                        <br />
                        <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#3EE07A] to-emerald-300">o melhor cuidado.</span>
                    </h2>

                    <p className="text-neutral-400 text-lg mb-12 max-w-lg mx-auto">
                        Fale agora. Diagnóstico em 24h, orçamento transparente e garantia real.
                    </p>

                    <a
                        href="https://wa.me/5511999999999"
                        className="group inline-flex items-center gap-3 bg-[#25D366] text-white px-12 py-5 rounded-2xl font-black uppercase tracking-widest text-lg shadow-[0_8px_50px_rgba(37,211,102,0.4)] hover:shadow-[0_12px_60px_rgba(37,211,102,0.6)] hover:scale-105 transition-all duration-300"
                    >
                        <svg className="w-7 h-7 group-hover:scale-110 transition-transform" fill="currentColor" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" /></svg>
                        Falar no WhatsApp
                    </a>

                    {/* Garantias */}
                    <div className="mt-12 flex flex-wrap justify-center gap-6 text-sm text-neutral-500">
                        {["✓ Diagnóstico gratuito", "✓ Orçamento sem compromisso", "✓ 6 meses de garantia"].map(g => (
                            <span key={g}>{g}</span>
                        ))}
                    </div>
                </div>
            </section>

            {/* FOOTER */}
            <footer className="py-10 border-t border-white/[0.05] bg-neutral-950 text-center">
                <div className="flex items-center justify-center gap-2 mb-4">
                    <div className="w-6 h-6 bg-[#3EE07A] rounded-lg flex items-center justify-center">
                        <svg className="w-3 h-3 text-neutral-950" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={3} d="M13 10V3L4 14h7v7l9-11h-7z" /></svg>
                    </div>
                    <span className="font-black text-white text-sm tracking-tighter">WFIX Tech</span>
                </div>
                <p className="text-[10px] font-bold uppercase tracking-[0.5em] text-neutral-700">
                    © 2026 · Todos os direitos reservados · Maringá – PR
                </p>
                <p className="text-[9px] text-neutral-800 mt-2">Preview LP3 – Hero Bold + Social Proof</p>
            </footer>

            {/* WhatsApp flutuante */}
            <a href="https://wa.me/5511999999999" className="fixed bottom-8 right-8 w-14 h-14 bg-[#25D366] text-white rounded-full flex items-center justify-center shadow-[0_0_25px_rgba(37,211,102,0.4)] z-[100] hover:scale-110 transition-transform duration-300">
                <svg className="w-7 h-7" fill="currentColor" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" /></svg>
            </a>
        </div>
    )
}
