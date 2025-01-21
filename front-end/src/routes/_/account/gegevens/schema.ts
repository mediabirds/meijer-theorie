import { z } from '$lib/zod'

export const dataSchema = z.object({
	email: z.string().email().optional(),
	firstName: z.string().required(),
	lastName: z.string().required()
})

export const passwordSchema = z
	.object({
		password: z.string().required(),
		confirmPassword: z.string().required()
	})
	.superRefine(({ confirmPassword, password }, ctx) => {
		if (confirmPassword !== password) {
			ctx.addIssue({
				code: 'custom',
				message: 'Wachtwoorden komen niet overeen',
				path: ['confirmPassword']
			})
		}
	})
