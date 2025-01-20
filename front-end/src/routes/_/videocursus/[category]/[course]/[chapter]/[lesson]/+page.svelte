<script lang="ts" module>
	import { onMount } from 'svelte'

	export type UserCours = Directus.SchemaMapper<
		Directus.UserVideoCourses,
		{
			videoCourse: Directus.VideoCourses
		}
	>
</script>

<script lang="ts">
	import { PUBLIC_DIRECTUS_URL } from '$env/static/public'
	import { Breadcrumbs } from '$lib/components/ui/breadcrumbs'
	import Box from '$lib/components/ui/layout/box.svelte'
	import { _ } from 'svelte-i18n'
	import { H } from '$lib/components/ui/heading'
	import { cn, toHoursAndMinutes } from '$lib/utils'
	import { navigating, page } from '$app/state'
	import Play from 'lucide-svelte/icons/play'
	import Pause from 'lucide-svelte/icons/pause'
	import ArrowLeft from 'lucide-svelte/icons/arrow-left'
	import ArrowRight from 'lucide-svelte/icons/arrow-right'
	import Button from '$lib/components/ui/button/button.svelte'
	import { Check } from 'lucide-svelte'
	import { onNavigate, invalidateAll } from '$app/navigation'
	import Collapsible from '$lib/components/collapsible/collapsible.svelte'
	import { site } from '$lib/stores/app.svelte.js'

	const { data } = $props()
	const chapter = $derived(data.chapter)
	const chapterIndex = $derived(
		data.chapters.findIndex((chapter) => chapter.slug === page.params.chapter)
	)
	const lesson = $derived(chapter.lessons.find((lesson) => lesson.title === page.params.lesson))
	const lessonIndex = $derived(
		chapter.lessons.findIndex((lesson) => lesson.title === page.params.lesson)
	)
	const prevLesson = $derived.by(() => {
		try {
			const lesson = chapter.lessons[lessonIndex - 1]

			if (!lesson) {
				const chapter = data.chapters[chapterIndex - 1]
				const lesson = chapter.lessons[chapter.lessons.length - 1]

				if (chapter) {
					return `/_/videocursus/${data.course.category}/${data.course.slug}/${chapter.slug}/${lesson.title}`
				}
			}

			return `/_/videocursus/${data.course.category}/${data.course.slug}/${chapter.slug}/${lesson.title}`
		} catch (_) {
			return null
		}
	})
	const nextLesson = $derived.by(() => {
		try {
			const lesson = chapter.lessons[lessonIndex + 1]

			if (!lesson) {
				const chapter = data.chapters[chapterIndex + 1]
				const lesson = chapter.lessons[0]

				if (chapter) {
					return `/_/videocursus/${data.course.category}/${data.course.slug}/${chapter.slug}/${lesson.title}`
				}
			}

			return `/_/videocursus/${data.course.category}/${data.course.slug}/${chapter.slug}/${lesson.title}`
		} catch (_) {
			return null
		}
	})

	let videoEl = $state<HTMLVideoElement>()
	let isPlaying = $state(false)

	onMount(() => {
		videoEl?.addEventListener('play', () => (isPlaying = true))
		videoEl?.addEventListener('pause', () => (isPlaying = false))

		return () => {
			videoEl?.removeEventListener('play', () => (isPlaying = true))
			videoEl?.removeEventListener('pause', () => (isPlaying = false))
		}
	})

	$effect(() => {
		if (isPlaying && !chapter.lessonsFinished.includes(lesson!.title)) {
			fetch('/api/lessons/finished', {
				method: 'POST',
				body: JSON.stringify({
					category: data.course.category,
					course: data.course.slug,
					chapter: chapter.slug,
					lesson: lesson!.title
				})
			}).then(() => invalidateAll())
		}
	})
</script>

<Breadcrumbs class="mb-6" />
<div class="grid grid-cols-1 gap-6 lg:grid-cols-[1fr_350px]">
	<div class="flex flex-col gap-6">
		<!-- svelte-ignore a11y_media_has_caption -->
		<video
			bind:this={videoEl}
			src={`${PUBLIC_DIRECTUS_URL}/assets/${lesson?.video}`}
			controls
			class="w-full rounded-2xl shadow-lg"
		></video>
		<Box class="flex flex-col  items-center justify-between gap-4 lg:flex-row">
			<span
				class="overflow-clip text-ellipsis text-lg font-bold lg:max-w-52 lg:text-nowrap lg:text-xl"
				>{chapter.title}</span
			>
			<div class="flex items-center gap-3">
				<Button
					variant="secondary"
					size="icon"
					href={prevLesson}
					class={cn(!prevLesson && 'pointer-events-none opacity-50')}
				>
					<ArrowLeft />
				</Button>
				<span>{lesson?.title}</span>
				<Button
					variant="secondary"
					size="icon"
					href={nextLesson}
					class={cn(!nextLesson && 'pointer-events-none opacity-50')}
				>
					<ArrowRight />
				</Button>
			</div>
		</Box>
	</div>
	<div class="flex flex-col gap-4">
		<Box class="overflow-clip p-0">
			{#snippet title()}
				<header class="p-6">
					<H level="4" class="text-lg font-bold">
						{$_('common.lesson_content')}
					</H>
				</header>
			{/snippet}
			<nav class="flex flex-col divide-y divide-neutral-200 border-t border-neutral-200">
				{#each data.chapters as chapter, i}
					<Collapsible open={page.params.chapter === chapter.slug}>
						{#snippet title()}
							<span class="flex items-center gap-4">
								<span
									class={cn(
										'flex h-8 w-8 items-center justify-center rounded-md bg-neutral-100 font-bold',
										chapter.slug === page.params.chapter && 'bg-primary-100',
										chapter.didFinish && 'bg-primary text-white'
									)}
								>
									{#if chapter.didFinish}
										<Check size="16" />
									{:else}
										{i + 1}
									{/if}
								</span>
								<span
									class="max-w-[200px] overflow-clip text-ellipsis text-nowrap text-left font-medium"
								>
									{chapter.title}
								</span>
							</span>
						{/snippet}
						<div class="divide-y divide-neutral-200">
							{#each chapter.lessons as lesson, i}
								<a
									href={`/_/videocursus/${data.course.category}/${data.course.slug}/${chapter.slug}/${lesson.title}`}
									class={cn(
										'flex items-center gap-4 px-6 py-4 transition-colors',
										'bg-neutral-100 hover:bg-primary-50',
										lesson.title === page.params.lesson && 'bg-primary-100'
									)}
								>
									{#if lesson.title === page.params.lesson}
										{#if isPlaying}
											<Play
												class="flex h-6 w-6 items-center justify-center text-secondary"
												strokeWidth="1"
											/>
										{:else}
											<Pause
												class="flex h-6 w-6 items-center justify-center text-secondary"
												strokeWidth="1"
											/>
										{/if}
									{:else if chapter.lessonsFinished.includes(lesson.title)}
										<Check class="relative top-[1px] h-6 w-6 text-primary" />
									{:else}
										<Pause
											class="flex h-6 w-6 items-center justify-center text-secondary"
											strokeWidth="1"
										/>
									{/if}
									{lesson.title}
									{#if lesson.estimatedDurationInMinutes}
										{@const duration = toHoursAndMinutes(lesson.estimatedDurationInMinutes)}
										<small class="ms-auto">
											{duration.hours
												? `${duration.hours} ${$_('common.hour_short')} ${duration.minutes} ${$_('common.minute_short')} `
												: `${duration.minutes} ${$_('common.minute_short')} `}
										</small>
									{/if}
								</a>
							{/each}
						</div>
					</Collapsible>
				{/each}
			</nav>
		</Box>
	</div>
</div>
