import type { Metadata } from 'next'

export const metadata: Metadata = {
    title: 'WFIX Tech | LP1 Preview – Reparo de Alta Performance',
    description: 'Preview da landing page minimalista dark para anúncios.',
}

export default function LP1Page() {
    return (
        <div className="min-h-screen bg-zinc-950 text-zinc-400 selection:bg-zinc-100 selection:text-zinc-900" style={{ fontFamily: "'Inter', sans-serif" }}>

            {/* NAV */}
            <nav className="fixed top-0 w-full z-50 bg-zinc-950/70 backdrop-blur-xl border-b border-zinc-800/60">
                <div className="max-w-6xl mx-auto px-6 h-20 flex items-center justify-between">
                    <div className="flex items-center gap-2">
                        <div className="w-8 h-8 bg-[#3EE07A] rounded-lg flex items-center justify-center">
                            <svg className="w-4 h-4 text-zinc-950" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" /></svg>
                        </div>
                        <span className="text-white font-black tracking-tighter text-xl uppercase italic">
                            WFIX <span className="text-zinc-500">Tech.</span>
                        </span>
                    </div>

                    <div className="hidden md:flex items-center gap-8 text-xs font-bold uppercase tracking-widest">
                        <a href="#servicos" className="hover:text-white transition-colors">Serviços</a>
                        <a href="#contato" className="hover:text-white transition-colors">Sobre</a>
                        <a href="#contato" className="bg-white text-zinc-950 px-5 py-2.5 rounded-full hover:-translate-y-0.5 transition-all duration-300">Orçamento</a>
                    </div>

                    {/* Mobile - badge online */}
                    <div className="md:hidden flex items-center gap-2">
                        <span className="w-2 h-2 bg-green-500 rounded-full animate-pulse" />
                        <span className="text-[10px] font-bold uppercase text-zinc-500">Online</span>
                    </div>
                </div>
            </nav>

            {/* HERO */}
            <section className="relative pt-32 pb-20 overflow-hidden">
                {/* Grid BG */}
                <div className="absolute inset-0 bg-[linear-gradient(to_right,#27272a33_1px,transparent_1px),linear-gradient(to_bottom,#27272a33_1px,transparent_1px)] bg-[size:32px_32px] pointer-events-none" />
                {/* Blob verde */}
                <div className="absolute top-20 right-0 w-[600px] h-[600px] bg-[#3EE07A]/5 blur-[100px] rounded-full pointer-events-none" />

                <div className="max-w-6xl mx-auto px-6">
                    <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                        {/* Texto */}
                        <div className="z-10 text-center lg:text-left">
                            <span className="inline-block py-1 px-3 rounded-full bg-zinc-800 text-zinc-100 text-[10px] font-bold uppercase tracking-widest mb-6 border border-zinc-700">
                                Assistência Técnica Premium
                            </span>

                            <h1 className="text-5xl md:text-7xl font-black text-white italic uppercase tracking-tighter leading-none mb-6">
                                Reparo de <br />
                                <span className="text-[#3EE07A]">Alta</span>{" "}
                                <span className="text-zinc-500">Performance.</span>
                            </h1>

                            <p className="text-zinc-400 text-lg mb-10 max-w-lg mx-auto lg:mx-0 font-light">
                                Especialistas em diagnóstico avançado e reparos de hardware. Deixe o seu equipamento nas mãos de quem entende de tecnologia.
                            </p>

                            <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
                                <a href="#contato" className="bg-[#3EE07A] text-zinc-950 px-8 py-4 rounded-2xl font-bold uppercase tracking-widest hover:-translate-y-1 transition-all duration-300 text-center shadow-[0_0_30px_rgba(62,224,122,0.25)]">
                                    Solicitar Orçamento
                                </a>
                                <a href="#servicos" className="bg-zinc-900/60 backdrop-blur-sm text-white px-8 py-4 rounded-2xl font-bold uppercase tracking-widest hover:-translate-y-1 transition-all duration-300 text-center border border-zinc-700">
                                    Ver Serviços
                                </a>
                            </div>

                            {/* Stats */}
                            <div className="mt-12 flex items-center justify-center lg:justify-start gap-10">
                                {[
                                    { num: "500+", label: "Eq. Recuperados" },
                                    { num: "6m", label: "Garantia" },
                                    { num: "24h", label: "Diagnóstico" },
                                ].map(s => (
                                    <div key={s.label} className="text-center">
                                        <p className="text-2xl font-black text-white">{s.num}</p>
                                        <p className="text-[10px] uppercase tracking-widest text-zinc-600">{s.label}</p>
                                    </div>
                                ))}
                            </div>
                        </div>

                        {/* Imagem / Card visual */}
                        <div className="relative group hidden lg:block">
                            <div className="absolute -inset-1 bg-gradient-to-r from-[#3EE07A]/20 to-zinc-800 rounded-[40px] blur opacity-30 group-hover:opacity-60 transition duration-1000" />
                            <div className="relative bg-zinc-900 rounded-[40px] overflow-hidden border border-zinc-800">
                                {/* UI mockup */}
                                <div className="p-8">
                                    <div className="bg-zinc-950 rounded-2xl border border-zinc-800 p-6 mb-4">
                                        <div className="flex items-center justify-between mb-4">
                                            <div className="flex gap-2">
                                                <div className="w-3 h-3 rounded-full bg-red-500/50" />
                                                <div className="w-3 h-3 rounded-full bg-yellow-500/50" />
                                                <div className="w-3 h-3 rounded-full bg-green-500/50" />
                                            </div>
                                            <div className="text-[10px] text-zinc-600 uppercase tracking-widest">diagnóstico_wfix.exe</div>
                                        </div>
                                        <div className="space-y-2">
                                            {["Checando placa-mãe...", "Analisando temperatura...", "Testando memória RAM...", "Verificando SSD..."].map((line, i) => (
                                                <div key={line} className="flex items-center gap-3">
                                                    <div className={`w-2 h-2 rounded-full ${i < 3 ? 'bg-[#3EE07A]' : 'bg-zinc-700 animate-pulse'}`} />
                                                    <span className="text-xs text-zinc-400 font-mono">{line}</span>
                                                    {i < 3 && <span className="ml-auto text-[10px] text-[#3EE07A] font-bold">OK</span>}
                                                </div>
                                            ))}
                                        </div>
                                    </div>

                                    {/* Badge flutuante */}
                                    <div className="flex items-center gap-4 bg-[#3EE07A]/10 border border-[#3EE07A]/30 rounded-2xl p-4">
                                        <div className="w-10 h-10 rounded-xl bg-[#3EE07A]/20 flex items-center justify-center text-[#3EE07A]">
                                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
                                        </div>
                                        <div>
                                            <p className="text-[10px] text-zinc-500 uppercase tracking-widest">Hardware</p>
                                            <p className="text-sm font-bold text-white">Diagnóstico Concluído</p>
                                        </div>
                                        <p className="ml-auto text-[#3EE07A] font-black text-lg">✓</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* SERVIÇOS */}
            <section id="servicos" className="py-20 bg-zinc-900/40 border-y border-zinc-800/50">
                <div className="max-w-6xl mx-auto px-6">
                    <div className="text-center mb-16">
                        <h2 className="text-3xl font-black text-white uppercase italic tracking-tighter mb-4">O que resolvemos</h2>
                        <div className="w-12 h-1 bg-[#3EE07A] mx-auto rounded-full" />
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                        {[
                            {
                                icon: <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />,
                                title: "Hardware & PC",
                                desc: "Manutenção preventiva, montagem de máquinas gamer e reparo em placas de vídeo ou placas-mãe."
                            },
                            {
                                icon: <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M12 18h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z" />,
                                title: "Notebooks",
                                desc: "Troca de telas, teclados, baterias e reparos em carcaças. Especialistas em todas as marcas."
                            },
                            {
                                icon: <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4" />,
                                title: "Recuperação",
                                desc: "Recuperação de dados em HDs e SSDs danificados, além de otimização completa do sistema operacional."
                            }
                        ].map(s => (
                            <div key={s.title} className="bg-zinc-950/60 backdrop-blur-sm p-8 rounded-[32px] border border-zinc-800 hover:border-[#3EE07A]/40 transition-all duration-300 group">
                                <div className="w-12 h-12 bg-zinc-800 rounded-xl flex items-center justify-center mb-6 group-hover:bg-[#3EE07A] group-hover:text-zinc-950 transition-all duration-300 text-zinc-400">
                                    <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">{s.icon}</svg>
                                </div>
                                <h3 className="text-white font-bold text-xl mb-4 uppercase italic">{s.title}</h3>
                                <p className="text-sm leading-relaxed text-zinc-500">{s.desc}</p>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* PROCESSO */}
            <section className="py-20">
                <div className="max-w-6xl mx-auto px-6">
                    <div className="text-center mb-16">
                        <h2 className="text-3xl font-black text-white uppercase italic tracking-tighter mb-4">Como funciona?</h2>
                        <p className="text-zinc-500">Simples, rápido e transparente.</p>
                    </div>
                    <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                        {[
                            { n: "01", title: "Solicite", desc: "Abra um chamado pelo WhatsApp." },
                            { n: "02", title: "Diagnóstico", desc: "Em até 24h avaliamos seu equipamento." },
                            { n: "03", title: "Aprovação", desc: "Você aprova o orçamento antes de tudo." },
                            { n: "04", title: "Pronto!", desc: "Retirada com garantia documentada." },
                        ].map(step => (
                            <div key={step.n} className="text-center group">
                                <div className="w-14 h-14 rounded-2xl bg-zinc-900 border border-zinc-800 flex items-center justify-center mx-auto mb-4 group-hover:border-[#3EE07A]/50 transition-colors">
                                    <span className="text-xs font-black text-[#3EE07A]">{step.n}</span>
                                </div>
                                <h4 className="text-white font-bold text-sm uppercase tracking-widest mb-2">{step.title}</h4>
                                <p className="text-xs text-zinc-600">{step.desc}</p>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* CTA / CONTATO */}
            <section id="contato" className="py-20 bg-zinc-900/40 border-t border-zinc-800/50">
                <div className="max-w-4xl mx-auto px-6">
                    <div className="bg-zinc-950/80 backdrop-blur-sm p-10 md:p-16 rounded-[48px] border border-zinc-800 text-center relative overflow-hidden">
                        <div className="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-transparent via-[#3EE07A] to-transparent opacity-40" />
                        <div className="absolute inset-0 bg-gradient-to-br from-[#3EE07A]/5 to-transparent pointer-events-none" />

                        <h2 className="text-4xl md:text-5xl font-black text-white italic uppercase tracking-tighter mb-6 relative z-10">
                            Pronto para <br />
                            <span className="text-zinc-500">voltar à ativa?</span>
                        </h2>
                        <p className="text-zinc-400 mb-12 max-w-md mx-auto relative z-10">
                            Clique no botão abaixo. Atendimento rápido, sem rodeios e com garantia.
                        </p>

                        <div className="flex flex-col items-center gap-6 relative z-10">
                            <a
                                href="https://wa.me/5511999999999"
                                className="w-full sm:w-auto bg-[#25D366] text-white px-10 py-5 rounded-2xl font-black uppercase tracking-widest text-lg shadow-[0_0_30px_rgba(37,211,102,0.2)] flex items-center justify-center gap-3 hover:scale-105 transition-transform duration-300"
                            >
                                <svg className="w-7 h-7" fill="currentColor" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" /></svg>
                                Chamar no WhatsApp
                            </a>

                            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 w-full mt-4">
                                <div className="p-4 rounded-2xl bg-zinc-900 border border-zinc-800 text-left flex items-center gap-4">
                                    <svg className="w-4 h-4 text-zinc-500 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" /><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" /></svg>
                                    <div>
                                        <p className="text-[8px] font-bold uppercase tracking-widest text-zinc-600">Localização</p>
                                        <p className="text-xs text-zinc-100 font-bold italic">Maringá – Paraná</p>
                                    </div>
                                </div>
                                <div className="p-4 rounded-2xl bg-zinc-900 border border-zinc-800 text-left flex items-center gap-4">
                                    <svg className="w-4 h-4 text-zinc-500 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
                                    <div>
                                        <p className="text-[8px] font-bold uppercase tracking-widest text-zinc-600">Horário</p>
                                        <p className="text-xs text-zinc-100 font-bold italic">Seg a Sex: 09h às 18h</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* FOOTER */}
            <footer className="py-12 border-t border-zinc-900 text-center">
                <p className="text-[10px] font-bold uppercase tracking-[0.5em] text-zinc-700">
                    ⚡ WFIX Tech · 2026 · Todos os direitos reservados
                </p>
                <p className="text-[9px] text-zinc-800 mt-2">Preview LP1 – Dark Minimalista</p>
            </footer>

            {/* WhatsApp flutuante */}
            <a href="https://wa.me/5511999999999" className="fixed bottom-8 right-8 w-16 h-16 bg-[#25D366] text-white rounded-full flex items-center justify-center shadow-2xl z-[100] hover:scale-110 active:scale-95 transition-transform duration-300 shadow-[0_0_20px_rgba(37,211,102,0.3)]">
                <svg className="w-8 h-8" fill="currentColor" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" /></svg>
            </a>

        </div>
    )
}
