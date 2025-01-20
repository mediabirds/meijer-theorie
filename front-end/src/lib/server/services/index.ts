import { error, type RequestEvent } from '@sveltejs/kit'
import { State } from '../state'
import { VideoCourseService } from './video-course'
import { VideoCourses } from './video-courses'

export class Services {
	/**
	 * The request event containing URL and session information.
	 *
	 * @type {RequestEvent}
	 * @readonly
	 */
	readonly event: RequestEvent

	/**
	 * Current state of the request.
	 *
	 * @type {State}
	 * @readonly
	 */
	readonly state: State

	/**
	 * Initializes a new instance of the Services class with the given RequestEvent.
	 *
	 * @param event - The request event containing URL and session information.
	 */
	constructor(event: RequestEvent) {
		this.event = event
		this.state = new State(event)
	}

	videoCourse(category: string, course: string): VideoCourseService {
		if (!category) {
			category = this.event.locals.services.state.category!
		}

		if (!course) {
			course = this.event.locals.services.state.course!
		}

		return new VideoCourseService(this, category, course)
	}

	videoCourses() {
		return new VideoCourses(this)
	}
}
