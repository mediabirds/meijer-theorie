<script lang="ts">
	import { site, session } from '$lib/stores/app.svelte'
	import { onMount } from 'svelte'

	import '../app.css'

	let { children, data } = $props()

	onMount(() => {
		session.set({ ...data.session, user: data.user })
		// @ts-ignore
		site.set({ ...data.globals })
	})
</script>

{@render children()}
