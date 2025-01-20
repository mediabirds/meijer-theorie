<script lang="ts">
	import { page } from '$app/state'
	import { cn } from '$lib/utils'
	import { lowerCase, capitalize, rest } from 'lodash-es'
	import ChevronRight from 'lucide-svelte/icons/chevron-right'
	import type { HTMLAttributes } from 'svelte/elements'

	const paths = $derived(page.url.pathname.split('/').filter(Boolean))

	type Props = {} & HTMLAttributes<HTMLElement>

	const { ...restProps }: Props = $props()
</script>

<nav {...restProps} class={cn('flex flex-wrap items-center gap-1', restProps.class)}>
	{#each paths as path, i}
		{@const currentPath = '/' + paths.slice(0, i + 1).join('/')}
		{#if i < paths.length - 1}
			<a href={currentPath} class="font-medium text-neutral-600 hover:text-primary"
				>{capitalize(lowerCase(decodeURIComponent(path)))}</a
			>
			{#if i !== 0}
				<ChevronRight size="18" strokeWidth="1.5" class="relative top-[1px]" />
			{/if}
		{:else}
			<span>{capitalize(lowerCase(decodeURIComponent(path)))}</span>
		{/if}
	{/each}
</nav>

<!-- <nav
	class="mb-4 flex items-center gap-2 text-sm font-medium text-neutral-500"
	aria-label="Breadcrumb"
>
	<a href="/_/videocursus" class="hover:text-neutral-700">{$_('common.video_courses')}</a>
	<svg
		xmlns="http://www.w3.org/2000/svg"
		class="h-4 w-4"
		fill="none"
		viewBox="0 0 24 24"
		stroke="currentColor"
	>
		<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
	</svg>
	<a href={`/_/videocursus/${data.course.category}`} class="hover:text-neutral-700"
		>{data.course?.category}</a
	>
	<svg
		xmlns="http://www.w3.org/2000/svg"
		class="h-4 w-4"
		fill="none"
		viewBox="0 0 24 24"
		stroke="currentColor"
	>
		<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
	</svg>
	<span aria-current="page" class="text-neutral-700">{data.course.title}</span>
</nav> -->
