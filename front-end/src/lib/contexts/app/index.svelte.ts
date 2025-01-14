import { getContext, setContext } from 'svelte'

export type AppContext = {
	globals: Directus.Globals
}

export const setAppContext = (data: AppContext) =>
	setContext(
		'app',
		new (class {
			globals = $state(data.globals)
		})()
	)
export const getAppContext = () => getContext<AppContext>('app')
export const state = getAppContext()
