<script lang="ts">
	import type { Snippet } from 'svelte'
	import { H } from '../heading'
	import type { HTMLAttributes } from 'svelte/elements'
	import { cn } from '$lib/utils'

	type Props = {
		children: Snippet
		title?: Snippet | string
		description?: string
		href?: string
	} & Omit<HTMLAttributes<HTMLDivElement>, 'title'>

	const { children, title, description, ...restProps }: Props = $props()
</script>

<div {...restProps} class={cn('rounded-3xl bg-white p-8 shadow-lg', restProps.class)}>
	{#if title}
		{#if typeof title === 'string'}
			<H level="5">{title}</H>
		{:else}
			{@render title()}
		{/if}
	{/if}
	{#if description}
		<p class="mb-4 mt-1">{description}</p>
	{/if}
	{@render children()}
</div>
