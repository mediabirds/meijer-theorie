import { getContext, setContext } from 'svelte'

export type Globals = {
	description: string
	favicon: string
	logo: string
	social_links: unknown
	tagline: string
	title: string
	url: string
}

export type AppContext = {
	globals: Globals
}

export const APP_CONTEXT_KEY = 'APP_STATE'

class AppState {
	globals: Globals

	constructor(globals: Globals) {
		this.globals = globals
	}
}

export const setAppContext = (data: AppContext) =>
	setContext(APP_CONTEXT_KEY, new AppState(data.globals))
export const getAppContext = () => getContext<ReturnType<typeof setAppContext>>(APP_CONTEXT_KEY)
