<script lang="ts">
	import type { Snippet } from 'svelte'
	import { Collapsible } from 'bits-ui'
	import ChevronUp from 'lucide-svelte/icons/chevron-up'
	import ChevronDown from 'lucide-svelte/icons/chevron-down'
	import { slide } from 'svelte/transition'
	import { cn } from '$lib/utils'

	type Props = {
		children: Snippet
		title: string | Snippet
		open?: boolean
		class?: string
	}

	let { children, title, open = $bindable(false), class: classNames }: Props = $props()
</script>

<Collapsible.Root bind:open>
	<Collapsible.Trigger class={cn('flex w-full items-center px-6 py-6', classNames)}>
		{#if typeof title === 'string'}
			<span>{title}</span>
		{:else}
			{@render title()}
		{/if}
		{#if open}
			<ChevronUp class="ms-auto w-6 min-w-6 text-secondary" />
		{:else}
			<ChevronDown class="ms-auto w-6 min-w-6 text-primary" />
		{/if}
	</Collapsible.Trigger>
	<Collapsible.Content>
		{@render children()}
	</Collapsible.Content>
</Collapsible.Root>
