<script lang="ts">
	import { page } from '$app/state'
	import { Breadcrumbs } from '$lib/components/ui/breadcrumbs'
	import { Box } from '$lib/components/ui/layout'
	import { exam } from '$lib/stores/app.svelte'
	import { getImageUrl } from '$lib/utils'

	$inspect(exam)
</script>

<div class="mx-auto mt-6 max-w-screen-2xl">
	<div class="grid grid-cols-[1fr_400px] gap-6">
		<Box>
			<img
				src={getImageUrl(exam.component!.questions[0].item.thumbnail, { width: 700 })}
				alt={exam.component?.title}
				class="rounded-lg"
			/>
		</Box>
		<Box>asdasd</Box>
	</div>
</div>
