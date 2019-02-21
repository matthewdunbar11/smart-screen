import { Controller } from "stimulus"

export default class extends Controller {
  submit(event) {
    event.currentTarget.form.submit();
    event.currentTarget.disabled = true;
  }
}
