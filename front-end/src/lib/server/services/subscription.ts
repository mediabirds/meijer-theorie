import { readItem } from '@directus/sdk'
import type { Services } from '.'

export type Subscription = Directus.SchemaMapper<
	Directus.Subscriptions,
	{
		tiers: Directus.SubscriptionTiers[]
	}
>

export class SubscriptionService {
	constructor(
		readonly services: Services,
		readonly id: number
	) {}

	async fetch() {
		return await this.services.event.locals.directus.request<Subscription[]>(
			readItem('subscriptions', this.id, {
				fields: ['*', { tiers: ['*'] }]
			})
		)
	}
}
