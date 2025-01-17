import { browser } from '$app/environment'
import type { AuthenticationData } from '@directus/sdk'
import { getContext, hasContext, setContext } from 'svelte'

export type SiteState = {
	isMenuCollapsed: boolean
	description: string
	favicon: string
	logo: string
	social_links: unknown
	tagline: string
	title: string
	url: string
}

export let site: Site

export let session: Session

export class Site {
	isMenuCollapsed = $state.raw(false)
	description: string = $state.raw('')
	favicon: string = $state.raw('')
	logo: string = $state.raw('')
	social_links: unknown = $state.raw({})
	tagline: string = $state.raw('')
	title: string = $state.raw('')
	url: string = $state.raw('')

	set(data: ExcludeFunctionPropertyNames<SiteState>) {
		for (const [key, value] of Object.entries(data)) {
			if (key in this) {
				;(this as any)[key] = value
			}
		}
	}
}

export class Session {
	access_token?: string | null = $state.raw(null)
	refresh_token?: string | null = $state.raw(null)
	expires?: number | null = $state.raw(null)
	expires_at?: number | null = $state.raw(null)
	user?: App.Locals['user'] = $state.raw(null)

	set(data: ExcludeFunctionPropertyNames<Session>) {
		for (const [key, value] of Object.entries(data)) {
			if (key in this) {
				;(this as any)[key] = value
			}
		}
	}
}

type ExcludeFunctionPropertyNames<T> = Pick<
	T,
	{
		[K in keyof T]: T[K] extends Function ? never : K
	}[keyof T]
>

site = new Site()
session = new Session()
