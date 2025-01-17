import { Context } from 'runed'
import { type AppContext, getAppContext, setAppContext } from './index.svelte'
import type { AuthenticationData } from '@directus/sdk'

export type Globals = {
	description: string
	favicon: string
	logo: string
	social_links: unknown
	tagline: string
	title: string
	url: string
}

export type Site = {
	isMenuCollapsed: boolean
}

export const globals = new Context<AppContext['globals']>('APP_STATE')
export const session = new Context<App.Locals['session']>('APP_SESSION')
export const user = new Context<App.Locals['user']>('APP_SESSION')

export { getAppContext, setAppContext, type AppContext }
