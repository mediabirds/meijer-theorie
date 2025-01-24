<script lang="ts">
	import { Logo } from '$lib/components/logo'

	const { children } = $props()
</script>

<div class="absolute left-0 top-0 z-20 w-full">
	<div class="container p-6">
		<Logo width="200" />
	</div>
</div>
<main
	class="bg-shape flex h-screen flex-grow flex-col items-center justify-center overflow-clip bg-white"
>
	{@render children()}
</main>
