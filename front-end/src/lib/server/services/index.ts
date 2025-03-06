import type { RequestEvent } from '@sveltejs/kit'
import { State } from '../state'
import { VideoCourseService } from './video-course'
import { VideoCourses } from './video-courses'
import { AuthService } from './auth'
import { PracticeExamsService } from './practice-exams'
import { UserService } from './user'
import { PracticeExamService } from './practice-exam'
import { UserExamService } from './user-exam'
import { SubscriptionsService } from './subscriptions'
import { SubscriptionTierService } from './subscription-tier'
import { EmailService } from './email'
import { DownloadsService } from './downloads'

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
	 * Creates a new instance of the EmailService.
	 *
	 * @returns {EmailService} The EmailService instance.
	 */
	email() {
		return new EmailService(this)
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

	/**
	 * Creates a new instance of the PracticeExamService service.
	 *
	 * If `id` is not provided, it is taken from the current request state.
	 *
	 * @param {string} [id] - The id of the practice exam.
	 * @returns {PracticeExamService} The PracticeExamService service instance.
	 */
	practiceExam(id?: string) {
		if (!id) {
			id = this.state.practiceExam!
		}

		return new PracticeExamService(this, id)
	}

	/**
	 * Creates a new instance of the UserExamService service.
	 *
	 * @param {string} id - The id of the user exam.
	 * @returns {UserExamService} The UserExamService service instance.
	 */
	userExam(id: string) {
		return new UserExamService(this, id)
	}

	/**
	 * Creates a new instance of the UserService service.
	 *
	 * @returns {UserService} The UserService service instance.
	 */
	user(id?: string) {
		return new UserService(this, id ? id : this.state.user!.id)
	}

	/**
	 * Creates a new instance of the SubscriptionService service.
	 *
	 * @returns {SubscriptionService} The SubscriptionService service instance.
	 */
	subscriptions() {
		return new SubscriptionsService(this)
	}

	/**
	 * Creates a new instance of the SubscriptionTierService service.
	 *
	 * @param {string} id - The id of the subscription tier.
	 * @returns {SubscriptionTierService} The SubscriptionTierService service instance.
	 */
	subscriptionTier(id: string) {
		return new SubscriptionTierService(this, id)
	}

	/**
	 * Creates a new instance of the DownloadsService.
	 *
	 * @returns {DownloadsService} The DownloadsService instance.
	 */
	downloads() {
		return new DownloadsService(this)
	}
}
