<script lang="ts">
	import type { Snippet } from 'svelte'
	import { Collapsible } from 'bits-ui'
	import ChevronUp from 'lucide-svelte/icons/chevron-up'
	import ChevronDown from 'lucide-svelte/icons/chevron-down'
	import { slide } from 'svelte/transition'

	type Props = {
		children: Snippet
		title: string | Snippet
		open?: boolean
	}

	let { children, title, open = $bindable(false) }: Props = $props()
</script>

<Collapsible.Root bind:open>
	<Collapsible.Trigger class="flex w-full items-center px-6 py-6">
		{#if typeof title === 'string'}
			<span>{title}</span>
		{:else}
			{@render title()}
		{/if}
		{#if open}
			<ChevronUp strokeWidth="1" class="ms-auto w-6 min-w-6 text-secondary" />
		{:else}
			<ChevronDown strokeWidth="1" class="ms-auto w-6 min-w-6 text-primary" />
		{/if}
	</Collapsible.Trigger>
	<Collapsible.Content>
		{@render children()}
	</Collapsible.Content>
</Collapsible.Root>
