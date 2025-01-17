import { browser } from '$app/environment'
import { init, register } from 'svelte-i18n'

register('nl', () => import('./locales/nl.json'))

init({
	fallbackLocale: 'nl',
	initialLocale: browser ? window.navigator.language : 'nl'
})
