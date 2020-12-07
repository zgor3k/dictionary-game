module ApplicationHelper
  def result_row_classes(result)
    if result.positives > result.negatives
      'bg-green-900 bg-opacity-60'
    elsif result.positives < result.negatives
      'bg-red-900 bg-opacity-30'
    else
      'bg-gray-900 bg-opacity-60'
    end
  end

  def random_word
    word = Result.by_count(:desc).first(10).sample.word
    strategy = translate_strategy

    {
      word_id: word.id,
      word_to_translate: word_to_translate(word, strategy),
      strategy: strategy
    }
  end

  def translate_strategy
    %i[word translated_word].sample
  end

  def word_to_translate(word, strategy)
    word.public_send(strategy)
  end
end
