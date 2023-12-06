import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-form"
export default class extends Controller {

  connect() {
    console.log('hello from edit_form controller');
  }

  fieldChanged(event) {
    console.log(event.currentTarget);
    this.element.requestSubmit();
  }

  // displayForm() {
  //   this.infosTarget.classList.add("d-none")
  //   this.formTarget.classList.remove("d-none")
  // }

  // update(event) {
  //   event.preventDefault()
  //   const url = this.formTarget.action
  //   fetch(url, {
  //     method: "PATCH",
  //     headers: { "Accept": "text/plain" },
  //     body: new FormData(this.formTarget)
  //   })
  //     .then(response => response.text())
  //     .then((data) => {
  //       this.cardTarget.outerHTML = data
  //     })
  //   }
}
