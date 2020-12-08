import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'

export default class extends Controller {
  static targets = ['translate', 'wordid', 'strategy']

  connect () {
    StimulusReflex.register(this)
  }

  triggerResult() {
    this.stimulate('ResultReflex#trigger_result', {
      'translate': this.translateTarget.value,
      'word_id': this.wordidTarget.value,
      'strategy': this.strategyTarget.value
    });
  }

  next() {
    this.stimulate('ResultReflex#next', {
      'word_id': this.wordidTarget.value,
    });
  }
}
