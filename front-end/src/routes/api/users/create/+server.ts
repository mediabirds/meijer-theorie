import { json } from '@sveltejs/kit'
import { fromError } from 'zod-validation-error'
import z from 'zod'
import { createUser, readRoles, readUsers } from '@directus/sdk'
import { generatePassword } from '$lib/utils.js'
import { addDays } from 'date-fns'

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
		const existingUser = await locals.directus.request(
			readUsers({
				filter: { email: { _eq: data.email } }
			})
		)

		if (existingUser.length > 0) {
			const user = existingUser[0]
			const response = await locals.services.user(user.id).update({
				expiresAt: addDays(user.expiresAt!, subscriptionTier.daysOfAccess).toISOString(),
				subscription: subscriptionTier.id
			})

			const emailResponse = await locals.services.email().send(
				{
					to: user.email!,
					subject: 'MeijerTheorie, welkom!'
				},
				'subscription_updated',
				{
					days: subscriptionTier.daysOfAccess,
					firstName: user.first_name!
				}
			)

			if (emailResponse.accepted.length === 0) {
				return json({
					error: 'Email could not be sent',
					code: 'SERVER_ERROR'
				})
			}

			return json({
				data: response,
				status: 'SUBSCRIPTION_UPDATED'
			})
		}

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

		const response = await locals.services.email().send(
			{
				to: user.email!,
				subject: 'MeijerTheorie, welkom!'
			},
			'account_created',
			{
				days: subscriptionTier.daysOfAccess,
				firstName: user.first_name!,
				username: user.email!,
				password: generatedPassword
			}
		)

		if (response.accepted.length === 0) {
			return json({
				error: 'Email could not be sent',
				code: 'SERVER_ERROR'
			})
		}

		return json({
			code: 'USER_CREATED',
			data: userData
		})
	} catch (_) {
		console.log(_)

		return json({
			error: 'Something went wrong',
			code: 'SERVER_ERROR',
			data: _
		})
	}
}
