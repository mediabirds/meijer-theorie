import { message, type ErrorStatus, type SuperValidated } from 'sveltekit-superforms'

export const error = <Form extends Record<string, any>, T extends Record<string, any>>(
	form: SuperValidated<Form>,
	status: ErrorStatus,
	code: string,
	data?: T
) => message(form, { success: false, code, data: data ?? null }, { status })

export const success = <Form extends Record<string, any>, T extends Record<string, any>>(
	form: SuperValidated<Form>,
	data?: T
) => message(form, { success: true, data: data ?? null })
