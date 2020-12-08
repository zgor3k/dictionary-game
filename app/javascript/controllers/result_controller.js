import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'

export default class extends Controller {
  static targets = ['translate', 'wordid', 'strategy']

  connect () {
    StimulusReflex.register(this);
  }

  clearInput() {
    let input = document.querySelector("input[name='translate']");
    input.value = '';
  }

  triggerResultWithEnter(event) {
    if (event.keyCode == 13) {
      this.triggerResult();
    }
  }

  triggerResult() {
    this.stimulate('ResultReflex#trigger_result', {
      'translate': this.translateTarget.value,
      'word_id': this.wordidTarget.value,
      'strategy': this.strategyTarget.value
    });
    this.clearInput();
  }

  next() {
    this.stimulate('ResultReflex#next', {
      'word_id': this.wordidTarget.value,
    });
    this.clearInput();
  }
}
