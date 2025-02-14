<script lang="ts">
	import { cn } from '$lib/utils'
	import type { Snippet } from 'svelte'
	import type { HTMLAttributes } from 'svelte/elements'

	type Props = {
		level?: '1' | '2' | '3' | '4' | '5' | '6'
		children: Snippet
	} & HTMLAttributes<HTMLHeadingElement>

	const { level = '1', children, ...restProps }: Props = $props()
</script>

<svelte:element
	this={`h${level}`}
	{...restProps}
	class={cn(
		level === '1' && 'font-heading text-4xl font-bold md:text-5xl',
		level === '2' && 'font-heading text-3xl font-semibold md:text-4xl',
		level === '3' && 'font-heading text-2xl font-semibold md:text-3xl',
		level === '4' && 'font-heading text-2xl font-semibold',
		level === '5' && 'font-heading text-xl font-semibold',
		level === '6' && 'font-heading text-lg font-semibold',
		restProps.class
	)}
>
	{@render children()}
</svelte:element>
