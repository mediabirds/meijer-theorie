import type { Services } from '.'
import nodemailer from 'nodemailer'
import {
	EMAIL_FROM,
	EMAIL_SMTP_HOST,
	EMAIL_SMTP_PASSWORD,
	EMAIL_SMTP_PORT,
	EMAIL_SMTP_USER
} from '$env/static/private'
import type SMTPTransport from 'nodemailer/lib/smtp-transport'
import type Mail from 'nodemailer/lib/mailer'
import AccountCreated from '$lib/email-templates/account-created.mjml?raw'
import mjml2html from 'mjml'
import Handlebars from 'handlebars'

export type AccountCreatedTemplate = EmailTemplate<
	'AccountCreated',
	{
		days: number
		firstName: string
		username: string
		password: string
	}
>

export type EmailTemplate<Name extends string, Context extends Record<string, any>> = {
	template: string
	name: Name
	context?: Context
}

export type EmailTemplates = {
	account_created: AccountCreatedTemplate
}

export class EmailService {
	protected transporter: nodemailer.Transporter<
		SMTPTransport.SentMessageInfo,
		SMTPTransport.Options
	>

	protected templates: EmailTemplates = {
		account_created: {
			template: AccountCreated,
			name: 'AccountCreated',
			context: {
				days: 0,
				firstName: '',
				username: '',
				password: ''
			}
		}
	}

	/**
	 * Initializes a new instance of the EmailService class.
	 *
	 * @param services - The services instance containing dependencies and shared resources.
	 *
	 * This constructor sets up the email transporter using nodemailer with SMTP configuration
	 * details such as host, port, and authentication credentials.
	 */
	constructor(protected services: Services) {
		this.transporter = nodemailer.createTransport({
			host: EMAIL_SMTP_HOST,
			port: EMAIL_SMTP_PORT as unknown as number,
			from: EMAIL_FROM,
			secure: false,
			auth: {
				user: EMAIL_SMTP_USER,
				pass: EMAIL_SMTP_PASSWORD
			}
		})
	}

	/**
	 * Send an email using the configured transporter.
	 *
	 * @param mailOptions - The mail options to pass to the transporter.
	 * @param tpl - The template to use.
	 * @param context - The context to pass to the template, defaults to the template's context.
	 * @return {Promise<SMTPTransport.SentMessageInfo>}
	 */
	send<T extends keyof EmailTemplates>(
		mailOptions: Mail.Options,
		tpl: T,
		context?: EmailTemplates[T]['context']
	) {
		const { html } = mjml2html(this.templates[tpl].template)
		const template = Handlebars.compile(html)

		mailOptions.from = EMAIL_FROM
		mailOptions.html = template(context)

		return this.transporter.sendMail(mailOptions)
	}

	/**
	 * Send an email using the configured transporter without using a template.
	 *
	 * @param mailOptions - The mail options to pass to the transporter.
	 * @return {Promise<SMTPTransport.SentMessageInfo>}
	 */
	sendRaw(mailOptions: Mail.Options) {
		return this.transporter.sendMail(mailOptions)
	}
}
