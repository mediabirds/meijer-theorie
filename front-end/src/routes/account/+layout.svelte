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

<style>
	:global(.bg-shape > *) {
		position: relative;
		z-index: 213312;
	}

	.bg-shape {
		position: relative;
	}

	.bg-shape::before,
	.bg-shape::after {
		display: block;
		content: '';
		left: calc(50% - 2500px);
		position: absolute;
		width: 5000px;
		height: 5000px;
		border-radius: 50%;
	}

	.bg-shape::before {
		top: calc(50% + 40px);
		z-index: 5;
		background-color: theme('colors.primary.700');
	}

	.bg-shape::after {
		top: 50%;
		z-index: 4;
		background-color: theme('colors.primary.600');
	}
</style>
