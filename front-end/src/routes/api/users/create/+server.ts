import { json } from '@sveltejs/kit'
import { fromError } from 'zod-validation-error'
import z from 'zod'
import { createUser, readRoles } from '@directus/sdk'
import { generatePassword } from '$lib/utils.js'
import mjml2html from 'mjml'
import AccountCreated from '$lib/email-templates/account-created.mjml?raw'
import Handlebars from 'handlebars'
import { EMAIL_FROM } from '$env/static/private'

const schema = z.object({
	email: z.string().email(),
	firstName: z.string().min(1, 'FIELD_REQUIRED'),
	lastName: z.string().min(1, 'FIELD_REQUIRED'),
	subscriptionTier: z.string().min(1, 'FIELD_REQUIRED')
})

export const POST = async ({ request, locals }) => {
	try {
		const body = await request.json()
		const { success, data, error } = await schema.safeParse(body)

		if (!success && error) {
			return json({
				error: fromError(error),
				status: 'VALIDATION_ERROR'
			})
		}

		const subscriptionTier = await locals.services.subscriptionTier(data.subscriptionTier).fetch()
		const generatedPassword = generatePassword(12, { symbols: false })
		const authenticatedRole = await locals.directus.request(
			readRoles({ filter: { name: { _eq: 'Authenticated' } } })
		)

		if (authenticatedRole.length === 0) {
			return json({
				error: 'No authenticated role found',
				status: 'NOT_FOUND'
			})
		}

		const { html } = mjml2html(AccountCreated)
		const template = Handlebars.compile(html)

		const userData = {
			email: data.email,
			first_name: data.firstName,
			last_name: data.lastName,
			password: generatedPassword,
			role: authenticatedRole[0].id,
			subscription: subscriptionTier.id,
			expiresAt: new Date(
				new Date().getTime() + subscriptionTier.daysOfAccess * 24 * 60 * 60 * 1000 + 60 * 60 * 1000
			).toISOString()
		}
		const user = await locals.directus.request(createUser(userData))

		const response = await locals.services.email().sendMail({
			to: user.email!,
			from: EMAIL_FROM,
			subject: 'Account gegevens',
			html: template({
				days: subscriptionTier.daysOfAccess,
				firstName: user.first_name,
				username: user.email,
				password: generatedPassword
			})
		})

		if (response.accepted.length === 0) {
			return json({
				error: 'Email could not be sent',
				status: 'SERVER_ERROR'
			})
		}

		return json({
			status: 'SUCCESS',
			data: userData
		})
	} catch (_) {
		console.log(_)

		return json({
			error: 'Something went wrong',
			status: 'SERVER_ERROR',
			data: _
		})
	}
}
