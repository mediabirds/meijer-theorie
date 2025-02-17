import { fail, superValidate } from 'sveltekit-superforms'
import { zod } from 'sveltekit-superforms/adapters'
import { dataSchema, passwordSchema } from './schema'
import { tryer } from '$lib/utils'
import { error, success } from '$lib/server/response'

export const load = async ({ locals }) => {
	return {
		dataForm: await superValidate(
			zod(dataSchema, {
				defaults: {
					firstName: locals.user?.first_name || '',
					lastName: locals.user?.last_name || '',
					email: locals.user?.email || ''
				}
			})
		),
		passwordForm: await superValidate(zod(passwordSchema))
	}
}

export const actions = {
	changeData: async ({ request, locals }) => {
		const form = await superValidate(request, zod(dataSchema))

		if (!form.valid) {
			return fail(400, { form })
		}

		const [userdata, err] = await tryer(
			async () => await locals.services.auth().updateProfile(form.data)
		)

		if (err || !userdata) {
			return error(form, 400, 'INVALID_DATA', err || userdata || undefined)
		}

		return success(form, userdata)
	},
	changePassword: async ({ request, locals }) => {
		const form = await superValidate(request, zod(passwordSchema))

		if (!form.valid) {
			return fail(400, { form })
		}

		const [userdata, err] = await tryer(
			async () => await locals.services.auth().changePassword(form.data.password)
		)

		if (err || !userdata) {
			return error(form, 400, 'INVALID_DATA', err || userdata || undefined)
		}

		return success(form, userdata)
	}
}
