module ResultHelper
  def random_word
    word = Result.by_negatives.first(10).sample.word
    strategy = translate_strategy

    {
      word_id: word.id,
      word_to_translate: word_to_translate(word, strategy),
      strategy: strategy
    }
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
