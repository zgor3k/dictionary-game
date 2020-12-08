# frozen_string_literal: true

class ResultReflex < ApplicationReflex
  def trigger_result(result)
    result = result.with_indifferent_access
    handle_by(result)
  end

  private

  def handle_by(result)
    word_object = Word.find_by(id: result[:word_id])

    if check_result(result, word_object)
      word_object.result.positives = + 1
    else
      word_object.result.negatives = + 1
    end

    word_object.result.save
  end

  def check_result(result, word_object)
    result[:translate].casecmp(word_object.public_send(result[:strategy])).zero?
  end
end
