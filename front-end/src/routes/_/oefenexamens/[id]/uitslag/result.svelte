<script lang="ts">
	import { Result } from '$lib/stores/exam/result.svelte'
	import { _ } from 'svelte-i18n'
	import { Box } from '$lib/components/ui/layout'
	import { H } from '$lib/components/ui/heading'
	import ArrowLeft from 'lucide-svelte/icons/arrow-left'
	import Collapsible from '$lib/components/collapsible/collapsible.svelte'
	import { cn, getImageUrl } from '$lib/utils'
	import { sortBy } from 'lodash-es'
	import { exam } from '$lib/stores/app.svelte'
	import { getContext, onMount } from 'svelte'

	const result = getContext<Result>('EXAM_RESULT')
</script>

<Box>
	{#snippet title()}
		<div class="flex items-center justify-between">
			<div>
				<H level="5">{exam?.title}</H>
			</div>
			<div>
				<button
					type="button"
					class="flex items-center gap-2 transition-transform hover:-translate-x-1"
					onclick={() => {
						result.showResult = false
						console.log(result)
					}}
				>
					<ArrowLeft />
					{$_('common.back_to_overview')}
				</button>
			</div>
		</div>
	{/snippet}

	<div class="mt-12 space-y-4">
		{#each result?.components! as component}
			<Collapsible class="rounded-lg bg-neutral-200">
				{#snippet title()}
					<H level="6" class="text-md font-sans font-medium">{component.title}</H>
				{/snippet}
				<div class="divide-y divide-neutral-200 rounded-lg bg-neutral-100">
					{#each component.questions as question}
						<div class="grid grid-cols-[300px_1fr] items-start gap-4 p-6">
							<img
								src={getImageUrl(question.item.thumbnail, { width: 300 })}
								alt={question.item.title}
								class="aspect-square rounded-lg object-cover"
							/>
							<div class="rounded-lg bg-white p-6">
								<H level="6" class="text-md mb-6 font-sans font-medium">{question.item.title}</H>
								{#if question.collection === 'questions_multiple_choice'}
									<div class="flex flex-col gap-2">
										{#each question.item.answers as answer, index}
											<label
												class={cn(
													'flex items-center justify-between rounded-lg bg-neutral-100 px-5 py-4',
													answer.isCorrectAnswer && answer.checked && '!bg-primary-100',
													answer.isCorrectAnswer && '!bg-primary-100',
													answer.checked && 'bg-secondary-100',
													'pointer-events-none'
												)}
											>
												<span>
													<input
														type="radio"
														value={answer.label}
														name="question-{question.id}"
														id="question-{question.id}-{index}"
														onchange={() => {
															// @ts-ignore
															question.item.answers.forEach(
																(a: { label: string; checked?: boolean }) => {
																	a.checked = false

																	if (a.label === answer.label) {
																		a.checked = true
																	}
																}
															)
														}}
														checked={answer.checked}
														class="pointer-events-none"
													/>
													<label for="question-{question.id}-{index}">{answer.label}</label>
												</span>
												{#if answer.isCorrectAnswer}
													<span class="text-sm">{$_('common.correct_answer')}</span>
												{/if}
											</label>
										{/each}
									</div>
								{/if}
								{#if question.collection === 'questions_in_order'}
									<div class="grid grid-cols-[1fr_30%] gap-12">
										<div class="flex w-full flex-col gap-2">
											<span class="block text-start">{$_('common.your_answer')}</span>
											{#each sortBy(question.item.answers, 'givenOrder') as answer, index}
												<span
													class={cn(
														'flex justify-between rounded-lg bg-primary-100 px-5 py-4',
														'[&.sortable-ghost]:border-2 [&.sortable-ghost]:border-dashed [&.sortable-ghost]:border-primary',
														'[&.sortable-ghost]:text-primary [&.sortable-ghost]:opacity-50',
														'[&.sortable-chosen_svg]:cursor-grabbing',
														answer.givenOrder !== answer.order && '!bg-secondary-100'
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
														class="text-primary"
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
										<div class="flex w-full flex-col gap-2">
											<span class="block text-end">{$_('common.correct_answer')}</span>
											<div class="flex w-full flex-col gap-2">
												{#each sortBy(question.item.answers, 'order') as answer, index}
													<span
														class={cn(
															'flex justify-between rounded-lg bg-primary-100 px-5 py-4',
															'[&.sortable-ghost]:border-2 [&.sortable-ghost]:border-dashed [&.sortable-ghost]:border-primary',
															'[&.sortable-ghost]:text-primary [&.sortable-ghost]:opacity-50',
															'[&.sortable-chosen_svg]:cursor-grabbing'
														)}
														data-id={answer.order}>{answer.label}</span
													>
												{/each}
											</div>
										</div>
									</div>
								{/if}
							</div>
						</div>
					{/each}
				</div>
			</Collapsible>
		{/each}
	</div>
</Box>
