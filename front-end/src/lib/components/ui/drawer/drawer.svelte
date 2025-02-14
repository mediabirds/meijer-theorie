<script lang="ts">
	import type { Snippet } from 'svelte'
	import { Dialog } from 'bits-ui'
	import { cn } from '$lib/utils'

	type Props = {
		children: Snippet
		open?: boolean
	}

	let { children, open = $bindable(false) }: Props = $props()
</script>

<Dialog.Root bind:open>
	<Dialog.Portal>
		<Dialog.Overlay
			class={cn(
				'fixed inset-0 z-50 bg-primary-50/50',
				'data-[state=open]:animate-in data-[state=closed]:animate-out',
				'data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0'
			)}
		/>
		<Dialog.Content
			class={cn(
				'w-full p-6 sm:max-w-[400px]',
				'fixed left-0 top-0 z-50 flex h-screen bg-white shadow-lg outline-none',
				'data-[state=open]:animate-in data-[state=closed]:animate-out',
				'data-[state=closed]:slide-out-to-right-0 data-[state=open]:slide-in-from-left'
			)}
		>
			{@render children()}
		</Dialog.Content>
	</Dialog.Portal>
</Dialog.Root>
