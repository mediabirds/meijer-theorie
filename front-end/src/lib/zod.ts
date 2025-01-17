import { z, type ZodTypeAny } from 'zod'

declare module 'zod' {
	interface ZodString {
		required(message?: string): ZodEffects<this, string, string>
	}

	interface ZodEffects<T extends ZodTypeAny, Output = T['_output'], Input = T['_input']> {
		required(message?: string): ZodEffects<this, Output, Input>
	}
}

z.ZodString.prototype.required = function (message) {
	return this.refine((val) => val && val.length > 0, {
		message: message ?? 'Dit veld is verplicht'
	})
}

export { z }
