<script lang="ts">
	import { Button } from '$lib/components/ui/button'
	import { Box } from '$lib/components/ui/layout'
	import { Tooltip } from '$lib/components/ui/tooltip'
	import { cn, getImageUrl } from '$lib/utils.js'
	import { _ } from 'svelte-i18n'

	const { data } = $props()
	console.log(data.courses[0])
</script>

<div class="grid gap-4 lg:grid-cols-2 xl:grid-cols-3">
	{#each data.courses as course}
		{@const currentChapter =
			course.chapters.find((chapter) => !chapter.didFinish) || course.chapters[0]}
		{@const finishedCount = course.chapters.filter((chapter) => chapter.didFinish).length}
		<Box title={course.title!}>
			<p class="mb-4 mt-1">{course.tagline}</p>
			<img
				src={getImageUrl(course.thumbnail, { width: 600 })}
				alt={course.title}
				class="aspect-video rounded-xl object-cover"
			/>
			<div class="mt-6 flex flex-col gap-2">
				<span class="flex justify-between">
					<span>{finishedCount} {$_('common.of')} {course.chapters.length}</span>
					<span>{((finishedCount / course.chapters.length) * 100).toFixed(0)}%</span>
				</span>
				<div class="flex gap-2">
					{#each course.chapters as chapter}
						<Tooltip tooltip={chapter.title}>
							{#snippet trigger({ props })}
								<a
									href={`/_/videocursus/${course.category}/${course.slug}/${chapter.slug}`}
									aria-label={chapter.title}
									class={cn(
										'h-4 w-full rounded-full bg-neutral-200 transition-colors hover:bg-primary-200',
										chapter.didFinish && 'bg-primary'
									)}
									{...props}
								></a>
							{/snippet}
						</Tooltip>
					{/each}
				</div>
				<div class="mt-4 flex justify-end">
					<Button
						variant="secondary"
						href={`/_/videocursus/${course.category}/${course.slug}/${currentChapter.slug}`}
					>
						{#if currentChapter.didFinish}
							{$_('common.restart')}
						{:else}
							{$_('common.continue')}
						{/if}
					</Button>
				</div>
			</div>
		</Box>
	{/each}
</div>
