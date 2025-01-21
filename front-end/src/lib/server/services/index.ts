import { error, type RequestEvent } from '@sveltejs/kit'
import { State } from '../state'
import { VideoCourseService } from './video-course'
import { VideoCourses } from './video-courses'
import { AuthService } from './auth'
import { PracticeExamsService } from './practice-exams'

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

	/**
	 * Creates a new instance of the VideoCourseService service.
	 *
	 * If `category` or `course` are not provided, they are taken from the current request state.
	 *
	 * @param {string} [category] - The category of the video course.
	 * @param {string} [course] - The slug of the video course.
	 * @returns {VideoCourseService} The VideoCourseService service instance.
	 */
	videoCourse(category: string, course: string): VideoCourseService {
		if (!category) {
			category = this.event.locals.services.state.category!
		}

		if (!course) {
			course = this.event.locals.services.state.course!
		}

		return new VideoCourseService(this, category, course)
	}

	/**
	 * Creates a new instance of the VideoCourses service.
	 *
	 * @returns {VideoCourses} The VideoCourses service instance.
	 */
	videoCourses() {
		return new VideoCourses(this)
	}

	/**
	 * Creates a new instance of the AuthService service.
	 *
	 * @returns {AuthService} The AuthService service instance.
	 */
	auth() {
		return new AuthService(this)
	}

	/**
	 * Creates a new instance of the PracticeExamsService service.
	 *
	 * @returns {PracticeExamsService} The PracticeExamsService service instance.
	 */
	practiceExams() {
		return new PracticeExamsService(this)
	}
}
