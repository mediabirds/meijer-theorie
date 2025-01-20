<script lang="ts">
	import { page } from '$app/state'
	import { cn } from '$lib/utils'
	import type { Snippet } from 'svelte'
	import type { HTMLAnchorAttributes } from 'svelte/elements'

	type Props = { children: Snippet; href: string } & Omit<HTMLAnchorAttributes, 'href'>

	let { href, children, ...restProps }: Props = $props()
</script>

<a {...restProps} {href} class={cn('transition-colors hover:text-primary', restProps.class)}>
	{@render children()}
</a>
