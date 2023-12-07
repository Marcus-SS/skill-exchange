import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static values = { userId: Number }
  static targets = [ "notif", "counter" ]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel" },
      { received: (data) => {
        const dataJson = JSON.parse(data)

        if (dataJson.receiver_id === this.userIdValue) {
          this.notifTarget.classList.add('bg-dark')
          this.counterTarget.innerText = dataJson.receiver_notification_unread
        }
      }}
      )
      console.log(`Subscribe to the notification channel for user ${this.userIdValue}.`)
    }
}
