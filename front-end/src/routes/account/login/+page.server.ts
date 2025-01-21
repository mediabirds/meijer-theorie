import { fail, redirect } from '@sveltejs/kit'
import { schema } from './schema'
import { message, superValidate } from 'sveltekit-superforms'
import { zod } from 'sveltekit-superforms/adapters'
import { login } from '$lib/server/modules/auth'
import { error, success } from '$lib/server/response'
import { tryer } from '$lib/utils'
import type { AuthenticationData } from '@directus/sdk'

export const load = async () => {
	return {
		form: await superValidate(zod(schema))
	}
}

export const actions = {
	default: async ({ request, locals, cookies }) => {
		const form = await superValidate(request, zod(schema))

		if (!form.valid) {
			return error(form, 400, 'INVALID_DATA')
		}

		const [credentials, err] = await tryer<
			AuthenticationData,
			{ errors: { message: string; extensions: { code: string } }[] }
		>(async () => await locals.services.auth().login(form.data.username, form.data.password))
		const date = new Date()

		if (err) {
			return error(form, 401, 'INVALID_CREDENTIALS', err.errors)
		}

		if (credentials) {
			date.setMilliseconds(date.getMilliseconds() + credentials.expires!)
			credentials.expires_at = date.getTime()

			cookies.set('session', JSON.stringify(credentials), {
				path: '/',
				expires: form.data.remember ? date : undefined
			})

			return redirect(301, '/_')
		}
	}
}
