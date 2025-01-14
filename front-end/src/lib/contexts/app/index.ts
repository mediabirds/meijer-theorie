import { getContext, setContext } from 'svelte'

export type AppContext = {
	globals: Directus.Globals
}
export const setAppContext = (data: AppContext) => setContext('app', () => data)
export const getAppContext = () => getContext<() => AppContext>('app')()
