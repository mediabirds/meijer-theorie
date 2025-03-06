import {
	login as directusLogin,
	refresh as directusRefresh,
	readMe,
	type AuthenticationData
} from '@directus/sdk'
import type { RequestEvent } from '@sveltejs/kit'
import { TestTube } from 'lucide-svelte'

export async function login(
	username: string,
	password: string,
	locals: App.Locals
): Promise<
	[AuthenticationData | null, { message: string; extensions: { code: string } }[] | null]
> {
	try {
		const credentials = await locals.directus.request(
			directusLogin(username, password, { mode: 'json' })
		)

		return [credentials, null]
	} catch (error: any) {
		return [null, error.errors]
	}
}

export async function logout(event: RequestEvent) {
	event.locals.directus.setToken(null)
	event.locals.session = null
	event.locals.user = null

	event.cookies.delete('session', { path: '/' })
}

export async function refresh(
	locals: App.Locals,
	refresh_token: string
): Promise<
	[AuthenticationData | null, { message: string; extensions: { code: string } }[] | null]
> {
	try {
		const credentials = await locals.directus.request(directusRefresh('json', refresh_token))

		return [credentials, null]
	} catch (error: any) {
		return [null, error.errors]
	}
}

export async function me(event: RequestEvent): Promise<[App.Locals['user'] | null, any]> {
	try {
		const user = await event.locals.directus.request<App.Locals['user']>(
			readMe({
				fields: [
					'*',
					{
						subscription: ['*', { subscription: ['type', 'id'] }],
						practiceExams: [
							'*',
							{
								exam: [
									'*',
									{
										components: [
											'*',
											{
												questions: ['id', 'collection', { item: ['*'] }]
											}
										]
									}
								]
							}
						],
						videoCourses: ['*', { videoCourse: ['*'] }]
					}
				]
			})
		)

		return [user, null]
	} catch (error: any) {
		return [null, error.errors]
	}
}
