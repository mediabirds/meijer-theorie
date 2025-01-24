export const createTimer = (durationInSeconds: number) => {
	let interval: number
	let minutes = $state(Math.floor(durationInSeconds / 60))
	let seconds = $state(durationInSeconds % 60)
	let ended = $state(false)

	interval = setInterval(() => {
		seconds -= 1
		if (seconds < 0) {
			minutes -= 1
			seconds = 59
		}

		if (minutes < 0) {
			minutes = 0
			seconds = 0
			ended = true

			clearInterval(interval)
		}
	}, 1000)

	return {
		get minutes() {
			return minutes.toString().padStart(2, '0')
		},
		get seconds() {
			return seconds.toString().padStart(2, '0')
		},
		get ended() {
			return ended
		}
	}
}
