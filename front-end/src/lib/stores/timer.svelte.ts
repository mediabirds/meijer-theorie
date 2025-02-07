import Emittery from 'emittery'

export const createTimer = (durationInSeconds: number) => {
	const emitter = new Emittery()
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
			emitter.emit('ended')
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
		},
		reset: (newDurationInSeconds?: number) => {
			newDurationInSeconds = newDurationInSeconds ?? durationInSeconds
			minutes = Math.floor(newDurationInSeconds / 60)
			seconds = newDurationInSeconds % 60
			ended = false
			clearInterval(interval)
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
					emitter.emit('ended')
				}
			}, 1000)
		},
		events: emitter
	}
}

export const createTimer2 = (ms: number) => {
	let interval: number
	let state = $state(ms)

	interval = setInterval(() => {
		state -= 100

		if (state <= 0) {
			state = 0

			clearInterval(interval)
		}
	}, 100)

	return {
		get value() {
			return state
		}
	}
}
