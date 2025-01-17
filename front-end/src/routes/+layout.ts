import '$lib/i18n'
import { browser } from '$app/environment'
import { locale, waitLocale } from 'svelte-i18n'

export const load = async ({ data }) => {
	if (browser) {
		locale.set(window.navigator.language)
	}

	await waitLocale()

	return {
		...data
	}
}
