<script lang="ts">
	import { Button } from '$lib/components/ui/button'
	import { Box } from '$lib/components/ui/layout'
	import Tooltip from '$lib/components/ui/tooltip/tooltip.svelte'
	import { cn, getImageUrl } from '$lib/utils.js'
	import { _ } from 'svelte-i18n'

	const { data } = $props()
	const currentLesson = $derived(
		data.chapter.didFinish
			? data.chapter.lessons[0]
			: data.chapter.lessons.find(
					(lesson) => !data.chapter.lessonsFinished.includes(lesson.title)
				)! || data.chapter.lessons[0]
	)
</script>

<Box title={data.chapter.title!} class="max-w-xl">
	<span class="mb-6 mt-2 block">{data.chapter.tagline}</span>
	<img
		src={getImageUrl(data.chapter.thumbnail)}
		alt={data.chapter.title}
		class="aspect-video rounded-xl object-cover object-center"
	/>
	<div class="mt-6 flex flex-col gap-2">
		<span class="flex items-center justify-between">
			<span>
				{$_('common.lesson')}
				{data.chapter.lessonsFinished.length}
				{$_('common.of')}
				{data.chapter.lessons.length}
			</span>
			<span>
				{(data.chapter.lessonsFinished.length / data.chapter.lessons.length) * 100}%
			</span>
		</span>
		<div class="flex gap-2">
			{#each data.chapter.lessons as lesson}
				<Tooltip tooltip={lesson.title}>
					{#snippet trigger({ props })}
						<a
							href={`/_/videocursus/${data.chapter.category}/${data.chapter.slug}/${lesson.title}`}
							aria-label={lesson.title}
							class={cn(
								'h-4 w-full rounded-full bg-neutral-200 transition-colors hover:bg-primary-200',
								data.chapter.lessonsFinished.includes(lesson.title) && 'bg-primary'
							)}
							{...props}
						></a>
					{/snippet}
				</Tooltip>
			{/each}
		</div>
	</div>
	<div class="mt-6 flex justify-end">
		<Button
			variant="secondary"
			href={`/_/videocursus/${data.chapter.category}/${data.chapter.slug}/${currentLesson.title}`}
		>
			{#if data.chapter.didFinish}
				{$_('common.restart')}
			{:else}
				{$_('common.continue')}
			{/if}
		</Button>
	</div>
</Box>
