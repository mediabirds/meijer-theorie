import { superValidate } from 'sveltekit-superforms'
import { zod } from 'sveltekit-superforms/adapters'
import { dataSchema, passwordSchema } from './schema'

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
