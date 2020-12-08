# frozen_string_literal: true

module ResultHelper
  def random_word
    word = Result.by_count.first(10).sample.word
    strategy = translate_strategy

    {
      word_id: word.id,
      word_to_translate: word_to_translate(word, strategy),
      strategy: strategy
    }
  end

  def action_result(result)
    return if result.blank?

    if result[:result]
      tag.p 'Good! ;-)', class: 'text-green-900'
    else
      content = ";-( tip: <br> #{result[:word].word} = #{result[:word].translated_word}"
      tag.p content.html_safe, class: 'text-red-900 text-center' # rubocop:disable Rails/OutputSafety
    end
  end

  private

  def translate_strategy
    %i[word translated_word].sample
  end

  def word_to_translate(word, strategy)
    method = case strategy
             when :word then :translated_word
             when :translated_word then :word
             end

    word.public_send(method)
  end
end
