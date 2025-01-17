import { z } from '$lib/zod'

export const schema = z.object({
	username: z.string().required(),
	password: z.string().required(),
	remember: z.boolean().default(false)
})
