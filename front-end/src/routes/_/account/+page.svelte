<script lang="ts">
	import { Box } from '$lib/components/ui/layout'
	import * as Form from '$lib/components/ui/form'
	import { _ } from 'svelte-i18n'
</script>

<Box title={$_('common.account')} class="max-w-2xl">
	<form method="POST"></form>
</Box>
