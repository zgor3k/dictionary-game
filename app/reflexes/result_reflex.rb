# frozen_string_literal: true

class ResultReflex < ApplicationReflex
  def trigger_result(result)
    result = result.with_indifferent_access
    handle_result(result)
  end

  def next(result)
    result = result.with_indifferent_access
    handle_result(result, check_for_result: false)
  end

  private

  def handle_result(result, check_for_result: true)
    word_object = Word.find_by(id: result[:word_id])
    check_result = check_result(result, word_object) if check_for_result

    if check_result
      word_object.result.positives += 1
    else
      word_object.result.negatives += 1
    end

    word_object.result.save
    result_from_reflex(check_result: check_result, word_object: word_object,
                       result: result)
  end

  def check_result(result, word_object)
    result[:translate].casecmp(
      word_object.public_send(result[:strategy])
    ).zero?
  end

  def result_from_reflex(check_result:, word_object:, result:)
    @result_from_reflex = {
      result: (check_result || false),
      word_object: word_object,
      passed_word: result[:translate]
    }
  end
end
