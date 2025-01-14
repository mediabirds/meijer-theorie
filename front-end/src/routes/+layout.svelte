<script lang="ts">
	import { setAppContext } from '$lib/contexts/app'

	import '../app.css'

	let { children, data } = $props()

	setAppContext({ globals: data.globals })
</script>

{@render children()}
