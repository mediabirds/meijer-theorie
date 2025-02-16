<script lang="ts">
	import { _ } from 'svelte-i18n'
	import { exam } from '$lib/stores/app.svelte'
	import { H } from '$lib/components/ui/heading'
	import { Button } from '$lib/components/ui/button'
	import DotIcon from 'lucide-svelte/icons/dot'
</script>

<div
	class="bg-shape flex h-full flex-grow justify-center rounded-xl bg-white p-4 pt-12 md:items-center md:pt-0"
>
	<div class="flex max-w-2xl flex-col gap-6">
		<H level="2" class="text-center">
			{exam.title}
		</H>
		<div class=" rounded-xl bg-neutral-100 p-8 shadow-lg">
			<p>{@html exam.description}</p>
			<div class="mt-4 rounded-lg bg-white p-6">
				<span class="font-medium">{$_('common.components')}</span>
				<ul class="mt-1">
					{#each exam.components! as component}
						<li class="flex items-center gap-1">
							<DotIcon strokeWidth="5" class="text-primary" />
							{component.title}
						</li>
					{/each}
				</ul>
			</div>
			<Button type="button" href="/_/oefenexamens/{exam.id}/start" class="mt-8" variant="secondary">
				{$_('pages.practice_exams.start_exam')}
			</Button>
		</div>
	</div>
</div>
