import typography from '@tailwindcss/typography'
import type { Config } from 'tailwindcss'

export default {
	content: ['./src/**/*.{html,js,svelte,ts}'],

	theme: {
		colors: {
			white: '#ffffff',
			black: '#000000',
			primary: {
				DEFAULT: '#3372ff',
				50: '#eff6ff',
				100: '#dbeafe',
				200: '#bfdbfe',
				300: '#93c5fd',
				400: '#60a5fa',
				500: '#3b82f6',
				600: '#2563eb',
				700: '#1d4ed8',
				800: '#1e40af',
				900: '#1e3a8a'
			},
			secondary: {
				DEFAULT: '#e64c4b',
				50: '#fff1f2',
				100: '#ffe4e6',
				200: '#fecdd3',
				300: '#fda4af',
				400: '#fb7185',
				500: '#f43f5e',
				600: '#e11d48',
				700: '#be123c',
				800: '#9f1239',
				900: '#881337'
			},
			neutral: {
				DEFAULT: '#f9fafb',
				100: '#f3f4f6',
				200: '#e5e7eb',
				300: '#d1d5db',
				400: '#9ca3af',
				500: '#6b7280',
				600: '#4b5563',
				700: '#374151',
				800: '#1f2937',
				900: '#111827'
			}
		},
		boxShadow: {
			sm: '0 1px 2px #004FFF0D',
			md: '0 4px 6px #004FFF0D',
			lg: '0 10px 20px #004FFF0D',
			xl: '0 14px 28px #004FFF0D',
			xxl: '0 20px 40px #004FFF0D'
		},
		extend: {}
	},

	plugins: [typography]
} satisfies Config
