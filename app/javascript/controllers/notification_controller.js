import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static values = { userId: Number }
  static targets = [ "counter" ]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel" },
      { received: (data) => {
        const dataJson = JSON.parse(data)

        // Update receiver navbar notification (receiver)
        if (dataJson.receiver_id === this.userIdValue) {
          this.counterTarget.innerText = dataJson.receiver_notification_unread
          if (dataJson.receiver_notification_unread === 0) {
            this.counterTarget.classList.add("d-none")
          } else {
            this.counterTarget.classList.add('badge')
            this.counterTarget.classList.add('bg-secondary')
            this.counterTarget.classList.remove("d-none")
          }
        }

        // Update CURRENT user navbar notification (sender)
        if (dataJson.sender_id === this.userIdValue) {
          console.log(dataJson.sender_notification_unread);
          this.counterTarget.innerText = dataJson.sender_notification_unread
          if (dataJson.sender_notification_unread === 0) {
            this.counterTarget.classList.add("d-none")
          } else {
            this.counterTarget.classList.add('badge')
            this.counterTarget.classList.add('bg-secondary')
            this.counterTarget.classList.remove("d-none")
          }
        }
      }}
      )
      console.log(`Subscribe to the notification channel for user ${this.userIdValue}.`)
    }
}
