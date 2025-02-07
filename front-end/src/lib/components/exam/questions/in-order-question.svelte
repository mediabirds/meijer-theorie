<script lang="ts">
	import SortableJS from 'sortablejs'
	import { _ } from 'svelte-i18n'
	import { onMount } from 'svelte'
	import { cn } from '$lib/utils'
	import { exam } from '$lib/stores/app.svelte'

	let sortableElement = $state<HTMLDivElement>()
	let sortable = $state<SortableJS>()

	onMount(() => {
		if (!sortableElement) {
			return
		}

		sortable = SortableJS.create(sortableElement, {
			animation: 150,
			handle: '.handle',
			onSort: (event) => {
				sortable
					?.toArray()
					.map(Number)
					.forEach((order, index) => {
						// @ts-ignore
						exam.currentQuestion!.item.answers[index].givenOrder = order
					})
			}
		})
	})
</script>

{#if exam.currentQuestion?.collection === 'questions_in_order'}
	<p class="mb-4">{$_('common.in_order_description')}</p>
	<div class="flex flex-col gap-2" bind:this={sortableElement}>
		{#each exam.currentQuestion!.item.answers as answer, index}
			<span
				class={cn(
					'flex justify-between rounded-lg bg-primary-100 px-5 py-4',
					'[&.sortable-ghost]:border-2 [&.sortable-ghost]:border-dashed [&.sortable-ghost]:border-primary',
					'[&.sortable-ghost]:text-primary [&.sortable-ghost]:opacity-50',
					'[&.sortable-chosen_svg]:cursor-grabbing'
				)}
				data-id={answer.order}
			>
				<span>{answer.label}</span>
				<svg
					xmlns="http://www.w3.org/2000/svg"
					width="24"
					height="24"
					viewBox="0 0 24 24"
					fill="none"
					stroke="currentColor"
					stroke-width="1"
					stroke-linecap="round"
					stroke-linejoin="round"
					class="handle cursor-grab text-primary"
				>
					<circle cx="9" cy="12" r="1" /><circle cx="9" cy="5" r="1" /><circle
						cx="9"
						cy="19"
						r="1"
					/>
					<circle cx="15" cy="12" r="1" /><circle cx="15" cy="5" r="1" /><circle
						cx="15"
						cy="19"
						r="1"
					/>
				</svg>
			</span>
		{/each}
	</div>
{/if}
