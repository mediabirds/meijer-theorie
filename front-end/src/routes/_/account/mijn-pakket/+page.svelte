<script lang="ts">
	import { Button } from '$lib/components/ui/button'
	import { H } from '$lib/components/ui/heading'
	import { session } from '$lib/stores/app.svelte'
	import { _ } from 'svelte-i18n'
	import ExternalLinkIcon from 'lucide-svelte/icons/square-arrow-out-up-right'

	console.log(session)
</script>

<div class="rounded-xl bg-neutral-100 p-8">
	<H level="5" class="mb-6">{$_('pages.account.subscription.title')}</H>
	<p>{$_('pages.account.subscription.description')}</p>
	<div class="mt-6 flex items-center justify-between rounded-xl bg-white p-6">
		<span>{session.user?.subscription?.title}</span>
		<Button variant="secondary" href="https://meijertheoriecursus.nl/pakketten/" target="_blank">
			{$_('pages.account.subscription.change')}
			<ExternalLinkIcon />
		</Button>
	</div>
</div>
