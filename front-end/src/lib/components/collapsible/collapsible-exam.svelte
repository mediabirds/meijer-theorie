<script lang="ts">
	import type { Snippet } from 'svelte'
	import type { PracticeExam } from '$lib/server/services/practice-exam'
	import { Collapsible } from 'bits-ui'
	import { cn } from '$lib/utils'
	import { _ } from 'svelte-i18n'
	import ChevronUp from 'lucide-svelte/icons/chevron-up'
	import ChevronDown from 'lucide-svelte/icons/chevron-down'

	type Props = {
		open?: boolean
		content: Snippet
		exam: PracticeExam
	}

	let { exam, content, open = $bindable(false) }: Props = $props()
</script>

<Collapsible.Root bind:open>
	<Collapsible.Trigger>
		{#snippet child({ props })}
			<button
				class={cn(
					'flex w-full items-center justify-between gap-2 bg-neutral-100',
					'rounded-xl p-4 text-neutral-600 transition-colors',
					open && 'bg-neutral-200 text-black'
				)}
				{...props}
			>
				<span class="flex items-center gap-4">
					<span class="h-8 w-8 rounded-md bg-neutral-200"></span>
					<span class="font-medium">{exam.title}</span>
				</span>
				<span class="flex gap-2">
					{exam.components.length}
					{exam.components.length > 1
						? $_('common.components').toLowerCase()
						: $_('common.component').toLowerCase()}
					{#if open}
						<ChevronUp class="ms-auto w-6 min-w-6 text-secondary" />
					{:else}
						<ChevronDown class="ms-auto w-6 min-w-6 text-primary" />
					{/if}
				</span>
			</button>
		{/snippet}
	</Collapsible.Trigger>
	<Collapsible.Content>
		{@render content()}
	</Collapsible.Content>
</Collapsible.Root>
