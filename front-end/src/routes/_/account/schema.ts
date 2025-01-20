import { first } from 'lodash-es'
import { z } from 'zod'

export const schema = z.object({
	email: z.string().email().required(),
	firstName: z.string().required(),
	lastName: z.string().required(),
	password: z.string().optional()
})
