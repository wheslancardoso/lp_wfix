'use client'

import { useEffect, useRef } from 'react'

export function FloatingOrbs() {
    return (
        <div className="fixed inset-0 pointer-events-none z-0 overflow-hidden">
            {/* Orbe principal verde - flutua lento */}
            <div
                className="absolute w-[500px] h-[500px] rounded-full blur-[120px] opacity-[0.07]"
                style={{
                    background: 'radial-gradient(circle, hsl(150 100% 50%), transparent 70%)',
                    top: '20%',
                    left: '10%',
                    animation: 'float-orb-1 20s ease-in-out infinite',
                }}
            />
            {/* Orbe secundário azul */}
            <div
                className="absolute w-[400px] h-[400px] rounded-full blur-[100px] opacity-[0.05]"
                style={{
                    background: 'radial-gradient(circle, hsl(220 90% 60%), transparent 70%)',
                    top: '60%',
                    right: '5%',
                    animation: 'float-orb-2 25s ease-in-out infinite',
                }}
            />
            {/* Orbe terciário roxo */}
            <div
                className="absolute w-[300px] h-[300px] rounded-full blur-[80px] opacity-[0.04]"
                style={{
                    background: 'radial-gradient(circle, hsl(270 70% 55%), transparent 70%)',
                    bottom: '10%',
                    left: '50%',
                    animation: 'float-orb-3 18s ease-in-out infinite',
                }}
            />
        </div>
    )
}

export function GridBackground() {
    return (
        <div className="fixed inset-0 pointer-events-none z-0">
            {/* Grid sutil */}
            <div
                className="absolute inset-0 opacity-[0.03]"
                style={{
                    backgroundImage: `
                        linear-gradient(rgba(255,255,255,0.1) 1px, transparent 1px),
                        linear-gradient(90deg, rgba(255,255,255,0.1) 1px, transparent 1px)
                    `,
                    backgroundSize: '60px 60px',
                }}
            />
            {/* Scan line animada */}
            <div
                className="absolute w-full h-[1px] left-0"
                style={{
                    background: 'linear-gradient(90deg, transparent, rgba(34,197,94,0.3), transparent)',
                    animation: 'scan-line 8s ease-in-out infinite',
                }}
            />
        </div>
    )
}

export function GlowLine() {
    return (
        <div className="relative w-full h-[1px] my-8 overflow-hidden">
            <div className="absolute inset-0 bg-white/5" />
            <div
                className="absolute h-full w-1/3"
                style={{
                    background: 'linear-gradient(90deg, transparent, hsl(150 100% 50% / 0.6), transparent)',
                    animation: 'glow-sweep 4s ease-in-out infinite',
                }}
            />
        </div>
    )
}

export function MouseGlow() {
    const glowRef = useRef<HTMLDivElement>(null)

    useEffect(() => {
        const handleMouseMove = (e: MouseEvent) => {
            if (glowRef.current) {
                glowRef.current.style.left = `${e.clientX}px`
                glowRef.current.style.top = `${e.clientY}px`
            }
        }
        window.addEventListener('mousemove', handleMouseMove)
        return () => window.removeEventListener('mousemove', handleMouseMove)
    }, [])

    return (
        <div
            ref={glowRef}
            className="fixed pointer-events-none z-[1] w-[400px] h-[400px] -translate-x-1/2 -translate-y-1/2 rounded-full hidden md:block"
            style={{
                background: 'radial-gradient(circle, rgba(34,197,94,0.06) 0%, transparent 70%)',
                transition: 'left 0.3s ease-out, top 0.3s ease-out',
            }}
        />
    )
}

export function ParticleField() {
    return (
        <div className="fixed inset-0 pointer-events-none z-0 overflow-hidden">
            {Array.from({ length: 20 }).map((_, i) => (
                <div
                    key={i}
                    className="absolute w-[2px] h-[2px] bg-white/20 rounded-full"
                    style={{
                        left: `${Math.random() * 100}%`,
                        top: `${Math.random() * 100}%`,
                        animation: `particle-float ${8 + Math.random() * 12}s ease-in-out infinite`,
                        animationDelay: `${Math.random() * 8}s`,
                    }}
                />
            ))}
        </div>
    )
}
