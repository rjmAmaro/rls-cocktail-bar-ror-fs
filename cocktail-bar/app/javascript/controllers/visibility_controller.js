import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "hideable", "button", "form" ]
    hide = true;

    showTargets() {
        this.hideableTargets.forEach(el => {
            el.hidden = false
        });
    }

    hideTargets() {
        this.hideableTargets.forEach(el => {
            el.hidden = true
        });
    }

    changeColorTargets() {

    }

    toggleForm() {
        this.formTargets.forEach((el) => {
            el.hidden = !el.hidden
        })
    }

    toggleTargets() {
        this.hideableTargets.forEach((el) => {
            el.hidden = !el.hidden

            this.buttonTargets.forEach((b) => {
                var btn = document.getElementsByClassName(b.className)[0];
                if (el.hidden) {
                    btn.style.backgroundColor = '#292B38FF'
                } else {
                    btn.style.backgroundColor = '#3B3D78FF'
                }
            });
        });
    }
}