# frozen_string_literal: true

module ResultHelper
  def random_word
    word = Result.by_count.first(10).sample.word
    strategy = translate_strategy

    {
      word_id: word.id,
      word_to_translate: word_to_translate(word, strategy).downcase,
      strategy: strategy
    }
  end

  def action_result(result)
    return if result.blank?

    if result[:result]
      tag.p 'Good! ;-)', class: 'text-green-900'
    else
      tag.p content_for_false(result), class: 'text-red-900 text-center'
    end
  end

  private

  def content_for_false(result)
    content = []
    if result[:passed_word]
      content << "It's not `#{result[:passed_word]}` ;-("
      content << '<br>'.html_safe
    end
    content << "#{result[:word_object].word} = #{result[:word_object].translated_word}"

    safe_join(content)
  end

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
