import type { Config } from 'tailwindcss'
import typography from '@tailwindcss/typography'
import tailwindcssAnimate from 'tailwindcss-animate'

export default {
	content: ['./src/**/*.{html,js,svelte,ts}'],
	theme: {
		container: {
			center: true
		},
		fontFamily: {
			sans: ['Poppins', 'Helvetica', 'Arial', 'sans-serif'],
			heading: ['Satoshi', 'sans-serif']
		},
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
				DEFAULT: '#f3f4f6',
				50: '#fafbfc',
				100: '#f3f4f6',
				200: '#e5e7eb',
				300: '#d2d6db',
				400: '#b9bec7',
				500: '#9fa5b1',
				600: '#858b9b',
				700: '#6b7184',
				800: '#52586e',
				900: '#393e58'
			},
			destructive: {
				DEFAULT: '#dc3545',
				50: '#ffe5e7',
				100: '#fcd4d7',
				200: '#f8b1b4',
				300: '#f38f91',
				400: '#ee6c6f',
				500: '#dc3545',
				600: '#bf2837',
				700: '#a01c2a',
				800: '#82111e',
				900: '#640713'
			},
			success: {
				DEFAULT: '#349a4a',
				50: '#ecfce4',
				100: '#d7f2c4',
				200: '#bde3a1',
				300: '#99d687',
				400: '#68c95f',
				500: '#349a4a',
				600: '#268f3c',
				700: '#1e7b2d',
				800: '#1a6c20',
				900: '#12581a'
			},
			warning: {
				DEFAULT: '#ffc107',
				50: '#fffae1',
				100: '#fff2c0',
				200: '#ffe98f',
				300: '#ffd55e',
				400: '#ffc107',
				500: '#ff9908',
				600: '#ff8a00',
				700: '#ff6d00',
				800: '#ff5200',
				900: '#ff2b00'
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

	plugins: [typography, tailwindcssAnimate]
} satisfies Config
