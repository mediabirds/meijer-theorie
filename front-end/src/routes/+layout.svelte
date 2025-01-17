<script lang="ts">
	import type { Globals } from '$lib/contexts/app/index.svelte'
	import { globals, session, user, site } from '$lib/contexts/app'

	import '../app.css'

	let { children, data } = $props()

	globals.set(data.globals as Globals)
	session.set(data.session)
	user.set(data.user)
	site.set({ isMenuCollapsed: false })
</script>

{@render children()}
