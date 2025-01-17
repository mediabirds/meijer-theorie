<script lang="ts" module>
	import { getContext, onMount, setContext } from 'svelte'

	export type Course = Directus.SchemaMapper<
		Directus.VideoCourses,
		{
			lessons: Directus.VideoCoursesLessons[]
		}
	>

	export type UserCours = Directus.SchemaMapper<
		Directus.UserVideoCourses,
		{
			videoCourse: Directus.VideoCourses
		}
	>

	export const setCourseContext = (course: Course) => setContext('course', course)
	export const getCourseContext = () => getContext<ReturnType<typeof setCourseContext>>('course')
</script>

<script lang="ts">
	import { PUBLIC_DIRECTUS_URL } from '$env/static/public'
	import { Breadcrumbs } from '$lib/components/ui/breadcrumbs'
	import Box from '$lib/components/ui/layout/box.svelte'
	import { _ } from 'svelte-i18n'
	import { H } from '$lib/components/ui/heading'
	import { cn } from '$lib/utils'
	import { page } from '$app/state'
	import Play from 'lucide-svelte/icons/play'
	import Pause from 'lucide-svelte/icons/pause'
	import { session } from '$lib/stores/app.svelte.js'
	import ArrowLeft from 'lucide-svelte/icons/arrow-left'
	import ArrowRight from 'lucide-svelte/icons/arrow-right'
	import Button from '$lib/components/ui/button/button.svelte'
	import { Check } from 'lucide-svelte'

	const { data } = $props()
	const course = setCourseContext(data.course)
	const userCourse = $derived(
		data.user?.videoCourses.find((userCourse) => userCourse.videoCourse.id === course.id)
	)
	const lesson = $derived(course.lessons.find((lesson) => lesson.title === page.params.lesson))
	const lessonIndex = $derived(
		course.lessons.findIndex((lesson) => lesson.title === page.params.lesson)
	)
	const prevLesson = $derived(
		course.lessons[lessonIndex - 1] as Directus.VideoCoursesLessons | undefined
	)
	const nextLesson = $derived(
		course.lessons[lessonIndex + 1] as Directus.VideoCoursesLessons | undefined
	)

	let videoEl = $state<HTMLVideoElement>()
	let isPlaying = $state(false)

	if (!lesson) {
		throw new Error('LESSON_NOT_FOUND')
	}

	onMount(() => {
		videoEl?.addEventListener('play', () => (isPlaying = true))
		videoEl?.addEventListener('pause', () => (isPlaying = false))

		return () => {
			videoEl?.removeEventListener('play', () => (isPlaying = true))
			videoEl?.removeEventListener('pause', () => (isPlaying = false))
		}
	})

	console.log(session)
</script>

<Breadcrumbs class="mb-6" />
<div class="grid grid-cols-[1fr_350px] gap-6">
	<div class="flex flex-col gap-6">
		<video
			bind:this={videoEl}
			src={`${PUBLIC_DIRECTUS_URL}/assets/${lesson.video}`}
			controls
			class="w-full rounded-2xl shadow-lg"
		></video>
		<Box class="flex items-center justify-between">
			<span class="text-xl font-bold">{lesson.title}</span>
			<div class="flex items-center gap-3">
				<Button
					variant="secondary"
					size="icon"
					href={`/_/videocursus/${course.category}/${course.slug}/${prevLesson?.title}`}
					class={cn(!prevLesson && 'pointer-events-none opacity-50')}
				>
					<ArrowLeft />
				</Button>
				<span>{lesson.title}</span>
				<Button
					variant="secondary"
					size="icon"
					href={`/_/videocursus/${course.category}/${course.slug}/${nextLesson?.title}`}
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
				{#each course.lessons as lesson, i}
					<a
						href={`/_/videocursus/${course.category}/${course.slug}/${lesson.title}`}
						class={cn(
							'flex items-center gap-4 px-6 py-4 transition-colors',
							'hover:bg-primary-50',
							lesson.title === page.params.lesson && 'bg-primary-50'
						)}
					>
						{#if lesson.title === page.params.lesson}
							{#if isPlaying}
								<Play
									class="text-secondary flex h-8 w-8 items-center justify-center"
									strokeWidth="1"
								/>
							{:else}
								<Pause
									class="text-secondary flex h-8 w-8 items-center justify-center"
									strokeWidth="1"
								/>
							{/if}
						{:else}
							<span
								class={cn(
									'flex h-8 w-8 items-center justify-center rounded bg-neutral-200 p-1 font-bold',
									userCourse?.lessonsFinished.includes(lesson.title) && 'bg-primary text-white'
								)}
							>
								{#if userCourse?.lessonsFinished.includes(lesson.title)}
									<Check class="relative top-[1px]" />
								{:else}
									{i + 1}
								{/if}
							</span>
						{/if}
						{lesson.title}
					</a>
				{/each}
			</nav>
		</Box>
	</div>
</div>
