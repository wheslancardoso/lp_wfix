import Link from 'next/link'
import { Instagram, MessageCircle, MapPin, Clock, ShieldCheck, Star, Phone } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { AnimateIn } from '@/components/ui/animate-in'
import Image from 'next/image'
import Script from 'next/script'

import { getTenantData } from '@/lib/get-tenant-data'

export function generateMetadata() {
  const { brandName } = getTenantData()
  return {
    title: 'WFIX Tech | Sua Referência em Goiânia',
    description: 'Qualidade, rapidez e garantia. Estamos prontos para te ajudar em Goiânia.',
  }
}

export default function Home() {
  const { whatsappNumber, formattedPhone, brandName } = getTenantData()

  const whatsappLink = `https://api.whatsapp.com/send?phone=${whatsappNumber}&text=Ol%C3%A1%2C%20vim%20pelo%20site%20e%20gostaria%20de%20um%20or%C3%A7amento.`

  return (
    <div className="dark flex min-h-screen flex-col bg-black text-white">

      {/* Google Tag Manager */}
      <Script
        id="gtm-script"
        strategy="afterInteractive"
        dangerouslySetInnerHTML={{
          __html: `(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-5FG7HKVH');`
        }}
      />

      {/* Google Tag Manager (noscript) */}
      <noscript>
        <iframe
          src="https://www.googletagmanager.com/ns.html?id=GTM-5FG7HKVH"
          height="0"
          width="0"
          style={{ display: 'none', visibility: 'hidden' }}
        />
      </noscript>

      {/* HEADER MINIMALISTA */}
      <header className="fixed top-0 w-full z-50 bg-black/80 backdrop-blur-md border-b border-white/5">
        <div className="max-w-5xl mx-auto px-4 h-16 flex items-center justify-between">
          <div className="flex items-center gap-2 font-bold text-xl tracking-tight">
            <span className="text-primary">WFIX <span className="text-white">Tech</span></span>
          </div>

          <div className="flex items-center gap-2">
            <span className="w-2 h-2 bg-green-500 rounded-full animate-pulse"></span>
            <span className="text-[9px] font-bold uppercase tracking-widest text-white/40">Online</span>
          </div>
        </div>
      </header>

      <main className="flex-1 pt-16">

        {/* HERO — Imagem de Fundo Full + Headline Genérica */}
        <section className="relative min-h-[75vh] md:min-h-[85vh] flex items-end justify-center overflow-hidden">
          {/* Imagem de fundo única */}
          <div className="absolute inset-0">
            <Image
              src="/hero/notebook-desk.png"
              alt="Ambiente profissional"
              fill
              className="object-cover brightness-[0.6] contrast-[1.1]"
              sizes="100vw"
              priority
              style={{
                maskImage: 'linear-gradient(to top, transparent 0%, black 60%)',
                WebkitMaskImage: 'linear-gradient(to top, transparent 0%, black 60%)',
              }}
            />
          </div>
          <div className="absolute inset-0 bg-gradient-to-t from-black via-black/50 to-transparent" />

          <div className="relative z-10 max-w-4xl mx-auto px-4 pb-12 md:pb-20 text-center">
            <AnimateIn delay={0.1}>
              <p className="text-[9px] md:text-[10px] font-black uppercase tracking-[0.5em] text-white/50 mb-4">
                Sua Referência em Goiânia
              </p>
            </AnimateIn>

            <AnimateIn delay={0.2}>
              <h1 className="text-4xl md:text-6xl lg:text-7xl font-black uppercase tracking-tighter leading-[0.95] mb-4">
                Bem-vindo à <br />
                <span className="bg-gradient-to-r from-green-400 via-emerald-400 to-green-500 bg-clip-text text-transparent animate-gradient-text">WFIX Tech.</span>
              </h1>
            </AnimateIn>

            <AnimateIn delay={0.3}>
              <p className="text-xs md:text-sm text-white/60 uppercase tracking-[0.2em] font-bold max-w-md mx-auto mb-8">
                Entre em contato via WhatsApp e tire todas suas dúvidas, estamos prontos para te ajudar.
              </p>
            </AnimateIn>

            <AnimateIn delay={0.4}>
              <Button size="lg" className="h-14 px-10 text-base font-black uppercase tracking-widest rounded-full bg-primary hover:bg-primary/90 text-primary-foreground transition-all duration-300 transform hover:scale-105 animate-glow-green" asChild>
                <Link href={whatsappLink} target="_blank" id="cta-whatsapp-hero">
                  <MessageCircle className="mr-2 h-5 w-5" />
                  Iniciar Conversa
                </Link>
              </Button>
            </AnimateIn>
          </div>
        </section>


        {/* CARDS DE CONTATO — Glass (Estilo LP-Base) */}
        <section className="py-10 md:py-16">
          <div className="max-w-4xl mx-auto px-4">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6">

              {/* WhatsApp Card */}
              <Link
                href={whatsappLink}
                target="_blank"
                id="cta-whatsapp-card"
                className="group bg-white/[0.03] backdrop-blur-xl border border-white/10 hover:border-green-500/30 p-8 rounded-[30px] flex flex-col items-center text-center transition-all duration-500 hover:-translate-y-2 hover:shadow-[0_8px_40px_rgba(34,197,94,0.12)]"
              >
                <div className="w-16 h-16 bg-green-500/10 rounded-full flex items-center justify-center mb-6 shadow-[0_0_25px_rgba(34,197,94,0.3)] group-hover:shadow-[0_0_40px_rgba(34,197,94,0.5)] transition-shadow duration-500">
                  <MessageCircle className="w-7 h-7 text-green-500 fill-green-500 group-hover:scale-110 transition-transform duration-300" />
                </div>
                <h2 className="text-xl font-black uppercase mb-2 text-white">WhatsApp</h2>
                <p className="text-[9px] uppercase font-bold tracking-widest text-white/30 mb-6">Resposta em até 3 min</p>
                <span className="bg-white text-black text-[9px] font-black px-6 py-2 rounded-full uppercase tracking-widest group-hover:bg-green-500 group-hover:text-white transition-colors duration-300">
                  Iniciar Conversa
                </span>
              </Link>

              {/* Instagram Card */}
              <a
                href="https://instagram.com/wfixtech"
                target="_blank"
                className="group bg-white/[0.03] backdrop-blur-xl border border-white/10 hover:border-pink-500/30 p-8 rounded-[30px] flex flex-col items-center text-center transition-all duration-500 hover:-translate-y-2 hover:shadow-[0_8px_40px_rgba(236,72,153,0.12)]"
              >
                <div className="w-16 h-16 bg-white/5 rounded-full flex items-center justify-center mb-6 group-hover:bg-gradient-to-tr group-hover:from-yellow-400/20 group-hover:via-pink-500/20 group-hover:to-purple-600/20 transition-all duration-500">
                  <Instagram className="w-7 h-7 text-white group-hover:text-pink-400 group-hover:scale-110 transition-all duration-300" />
                </div>
                <h2 className="text-xl font-black uppercase mb-2 text-white">Instagram</h2>
                <p className="text-[9px] uppercase font-bold tracking-widest text-white/30 mb-6">Conheça nosso trabalho</p>
                <span className="bg-white text-black text-[9px] font-black px-6 py-2 rounded-full uppercase tracking-widest group-hover:bg-gradient-to-r group-hover:from-pink-500 group-hover:to-purple-600 group-hover:text-white transition-all duration-300">
                  Seguir Perfil
                </span>
              </a>

            </div>

            {/* Info Cards Compactos */}
            <div className="grid grid-cols-1 sm:grid-cols-3 gap-3 mt-6">
              <div className="group bg-white/[0.03] border border-white/5 hover:border-white/10 p-4 rounded-2xl flex items-center gap-4 transition-all duration-300">
                <div className="w-9 h-9 rounded-full bg-white/5 group-hover:bg-primary/10 flex items-center justify-center shrink-0 transition-colors duration-300">
                  <Phone className="w-4 h-4 text-white/40 group-hover:text-primary transition-colors duration-300" />
                </div>
                <div>
                  <p className="text-[8px] font-black uppercase tracking-widest text-white/30">Ligar Agora</p>
                  <p className="text-[10px] font-bold text-white">{formattedPhone}</p>
                </div>
              </div>

              <div className="group bg-white/[0.03] border border-white/5 hover:border-white/10 p-4 rounded-2xl flex items-center gap-4 transition-all duration-300">
                <div className="w-9 h-9 rounded-full bg-white/5 group-hover:bg-blue-500/10 flex items-center justify-center shrink-0 transition-colors duration-300">
                  <Clock className="w-4 h-4 text-white/40 group-hover:text-blue-400 transition-colors duration-300" />
                </div>
                <div>
                  <p className="text-[8px] font-black uppercase tracking-widest text-white/30">Horário</p>
                  <p className="text-[10px] font-bold text-white">Seg-Sex 08h-18h</p>
                </div>
              </div>

              <div className="group bg-white/[0.03] border border-white/5 hover:border-white/10 p-4 rounded-2xl flex items-center gap-4 sm:col-span-1 transition-all duration-300">
                <div className="w-9 h-9 rounded-full bg-white/5 group-hover:bg-red-500/10 flex items-center justify-center shrink-0 transition-colors duration-300">
                  <MapPin className="w-4 h-4 text-white/40 group-hover:text-red-400 transition-colors duration-300" />
                </div>
                <div>
                  <p className="text-[8px] font-black uppercase tracking-widest text-white/30">Localização</p>
                  <p className="text-[10px] font-bold text-white">Goiânia - GO</p>
                </div>
              </div>
            </div>
          </div>
        </section>


        {/* GALERIA — Imagens que falam pelo trabalho */}
        <section className="py-10 md:py-20">
          <div className="max-w-4xl mx-auto px-4">
            <AnimateIn>
              <div className="text-center mb-10">
                <h2 className="text-3xl md:text-5xl font-black uppercase tracking-tighter mb-2">Nosso Trabalho</h2>
                <p className="text-[10px] md:text-xs uppercase tracking-[0.4em] font-bold text-white/30 italic">As imagens falam por nós</p>
              </div>
            </AnimateIn>

            <div className="grid grid-cols-2 md:grid-cols-3 gap-3 md:gap-4">
              {/* Cada card de imagem — sem texto revelador */}
              <div className="group relative aspect-square rounded-2xl overflow-hidden border border-white/10 hover:border-white/20 transition-all duration-500 hover:shadow-[0_8px_32px_rgba(0,0,0,0.4)]">
                <Image src="/hero/notebook-desk.png" alt="Ambiente de trabalho" fill className="object-cover transition-transform duration-700 group-hover:scale-110 brightness-90 group-hover:brightness-100" sizes="(max-width: 768px) 50vw, 33vw" />
              </div>

              <div className="group relative aspect-square rounded-2xl overflow-hidden border border-white/10 hover:border-white/20 transition-all duration-500 hover:shadow-[0_8px_32px_rgba(0,0,0,0.4)]">
                <Image src="/hero/tools-tech.png" alt="Ferramentas profissionais" fill className="object-cover transition-transform duration-700 group-hover:scale-110 brightness-90 group-hover:brightness-100" sizes="(max-width: 768px) 50vw, 33vw" />
              </div>

              <div className="group relative aspect-square rounded-2xl overflow-hidden border border-white/10 hover:border-white/20 transition-all duration-500 hover:shadow-[0_8px_32px_rgba(0,0,0,0.4)]">
                <Image src="/hero/components-tech.png" alt="Componentes de Tecnologia" fill className="object-cover transition-transform duration-700 group-hover:scale-110 brightness-90 group-hover:brightness-100" sizes="(max-width: 768px) 50vw, 33vw" />
              </div>

              <div className="group relative aspect-square rounded-2xl overflow-hidden border border-white/10 hover:border-white/20 transition-all duration-500 hover:shadow-[0_8px_32px_rgba(0,0,0,0.4)]">
                <Image src="/services/safe-workspace-premium.png" alt="Equipamento Gamer" fill className="object-cover transition-transform duration-700 group-hover:scale-110 brightness-90 group-hover:brightness-100" sizes="(max-width: 768px) 50vw, 33vw" />
              </div>

              <div className="group relative aspect-square rounded-2xl overflow-hidden border border-white/10 hover:border-white/20 transition-all duration-500 hover:shadow-[0_8px_32px_rgba(0,0,0,0.4)]">
                <Image src="/services/printer-card.png" alt="Equipamento corporativo" fill className="object-cover transition-transform duration-700 group-hover:scale-110 brightness-90 group-hover:brightness-100" sizes="(max-width: 768px) 50vw, 33vw" />
              </div>

              <div className="group relative aspect-square rounded-2xl overflow-hidden border border-white/10 hover:border-white/20 transition-all duration-500 hover:shadow-[0_8px_32px_rgba(0,0,0,0.4)]">
                <Image src="/hero/pc-gamer-aesthetic.png" alt="Setup de alta performance" fill className="object-cover transition-transform duration-700 group-hover:scale-110 brightness-90 group-hover:brightness-100" sizes="(max-width: 768px) 50vw, 33vw" />
              </div>
            </div>
          </div>
        </section>


        {/* DIFERENCIAIS — Cards Glass com Ícones (Estilo Troca Cel) */}
        <section className="py-16 md:py-24 bg-black/70 backdrop-blur-sm">
          <div className="max-w-4xl mx-auto px-4 text-center">
            <h2 className="text-3xl md:text-5xl font-black uppercase mb-2 tracking-tighter">Nossos Diferenciais</h2>
            <p className="text-[10px] md:text-xs uppercase tracking-[0.4em] mb-12 md:mb-16 font-bold text-white/30 italic">Estrutura, qualidade e atendimento</p>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-6 md:gap-8">
              <div className="group bg-white/[0.03] backdrop-blur-xl border border-white/[0.08] hover:border-primary/20 p-8 md:p-10 rounded-3xl relative overflow-hidden transition-all duration-500 hover:-translate-y-1 hover:shadow-[0_8px_40px_rgba(34,197,94,0.08)]">
                <span className="absolute -top-2 -right-2 text-white/5 text-7xl font-black italic">01</span>
                <MapPin className="w-12 h-12 md:w-14 md:h-14 mb-6 text-primary mx-auto group-hover:scale-110 transition-transform duration-300" />
                <h3 className="text-lg md:text-xl font-black mb-3 uppercase">Presença Local</h3>
                <p className="text-sm text-white/60 leading-relaxed">Atuação em Goiânia e região, com estrutura física para facilitar o contato.</p>
              </div>

              <div className="group bg-white/[0.03] backdrop-blur-xl border border-primary/20 hover:border-primary/40 p-8 md:p-10 rounded-3xl relative overflow-hidden transition-all duration-500 hover:-translate-y-1 hover:shadow-[0_8px_40px_rgba(34,197,94,0.12)]">
                <span className="absolute -top-2 -right-2 text-white/5 text-7xl font-black italic">02</span>
                <ShieldCheck className="w-12 h-12 md:w-14 md:h-14 mb-6 text-primary mx-auto group-hover:scale-110 transition-transform duration-300" />
                <h3 className="text-lg md:text-xl font-black mb-3 uppercase">Garantia de 180 dias</h3>
                <p className="text-sm text-white/60 leading-relaxed">Confiança total no que fazemos. Todos os trabalhos com garantia estendida.</p>
              </div>

              <div className="group bg-white/[0.03] backdrop-blur-xl border border-white/[0.08] hover:border-green-500/20 p-8 md:p-10 rounded-3xl relative overflow-hidden transition-all duration-500 hover:-translate-y-1 hover:shadow-[0_8px_40px_rgba(34,197,94,0.08)]">
                <span className="absolute -top-2 -right-2 text-white/5 text-7xl font-black italic">03</span>
                <Star className="w-12 h-12 md:w-14 md:h-14 mb-6 text-green-500 mx-auto group-hover:scale-110 transition-transform duration-300" />
                <h3 className="text-lg md:text-xl font-black mb-3 uppercase">Atendimento Rápido</h3>
                <p className="text-sm text-white/60 leading-relaxed italic">Canal direto pelo WhatsApp. Resposta e orçamento sem enrolação.</p>
              </div>
            </div>
          </div>
        </section>


        {/* BOTÃO FLUTUANTE WHATSAPP */}
        <a
          id="cta-whatsapp-float"
          href={whatsappLink}
          target="_blank"
          className="fixed bottom-6 right-6 z-50 flex items-center justify-center w-14 h-14 bg-[#25D366] rounded-full hover:scale-110 transition-all duration-300"
          style={{ animation: 'pulse-whatsapp 2s ease-in-out infinite' }}
        >
          <MessageCircle className="w-7 h-7 text-white fill-white" />
        </a>
      </main>

      {/* FOOTER MÍNIMO */}
      <footer className="py-10 md:py-14 border-t border-white/5 text-center">
        <p className="text-[8px] md:text-[9px] font-bold uppercase tracking-[0.5em] text-white/20">
          {brandName} • Goiânia - GO • {new Date().getFullYear()}
        </p>
        <div className="mt-5 flex items-center justify-center gap-5">
          <a href={whatsappLink} target="_blank" className="w-8 h-8 rounded-full bg-white/5 hover:bg-green-500/20 flex items-center justify-center transition-colors duration-300" aria-label="WhatsApp">
            <MessageCircle className="w-4 h-4 text-white/30 hover:text-green-400 transition-colors duration-300" />
          </a>
          <a href="https://instagram.com/wfixtech" target="_blank" className="w-8 h-8 rounded-full bg-white/5 hover:bg-pink-500/20 flex items-center justify-center transition-colors duration-300" aria-label="Instagram">
            <Instagram className="w-4 h-4 text-white/30 hover:text-pink-400 transition-colors duration-300" />
          </a>
          <a href={`tel:+5562994516025`} className="w-8 h-8 rounded-full bg-white/5 hover:bg-primary/20 flex items-center justify-center transition-colors duration-300" aria-label="Ligar">
            <Phone className="w-4 h-4 text-white/30 hover:text-primary transition-colors duration-300" />
          </a>
        </div>
        <div className="mt-4 flex items-center justify-center gap-6 text-white/20">
          <Link href="/politica-privacidade" className="text-[8px] uppercase tracking-widest hover:text-white/40 transition-colors">Privacidade</Link>
          <Link href="/termos-uso" className="text-[8px] uppercase tracking-widest hover:text-white/40 transition-colors">Termos</Link>
        </div>
        <p className="mt-4 text-[8px] text-white/10">CNPJ: 64.928.869/0001-83</p>
      </footer>
    </div>
  )
}
