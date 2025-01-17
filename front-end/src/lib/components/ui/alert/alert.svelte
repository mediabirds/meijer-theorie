<script lang="ts" module>
	import { cn } from '$lib/utils'
	import type { WithElementRef } from 'bits-ui'
	import XIcon from 'lucide-svelte/icons/x'
	import { onMount, type Snippet } from 'svelte'
	import type { HTMLAttributes } from 'svelte/elements'
	import { type VariantProps, tv } from 'tailwind-variants'

	export const alertVariants = tv({
		base: cn('border bg-neutral-200 rounded-md px-4 py-3 flex justify-between items-start gap-4'),
		variants: {
			variant: {
				primary: 'bg-primary-100 text-primary',
				secondary: 'bg-secondary-100 text-secondary',
				success: 'bg-success-50 text-success',
				warning: 'bg-warning-50 text-warning-700',
				destructive: 'bg-destructive-50 text-destructive'
			}
		},
		defaultVariants: {
			variant: 'primary'
		}
	})

	export type AlertVariant = VariantProps<typeof alertVariants>['variant']

	export type AlertProps = WithElementRef<HTMLAttributes<HTMLDivElement>> & {
		variant?: AlertVariant
		children: Snippet
		dismissible?: boolean
		dismissMs?: number
	}
</script>

<script lang="ts">
	let {
		variant = 'primary',
		dismissible = false,
		dismissMs,
		children,
		ref = $bindable(null),
		...restProps
	}: AlertProps = $props()

	onMount(() => {
		if (dismissMs) {
			setTimeout(() => ref?.remove(), dismissMs)
		}
	})
</script>

<div bind:this={ref} class={cn(alertVariants({ variant }), restProps.class)}>
	{@render children()}
	{#if dismissible}
		<button type="button" onclick={() => ref?.remove()}>
			<XIcon strokeWidth="1" />
		</button>
	{/if}
</div>
