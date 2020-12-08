# frozen_string_literal: true

class DictionaryLoader
  FILE = Rails.root.join('config/dictionary.yml').freeze

  class << self
    def call
      Word.upsert_all(dictionary.values, unique_by: 'index_words_on_word') # rubocop:disable Rails/SkipsModelValidations
      Word.create_results!
      update_timestamps!
    end

    private

    def load_file
      @load_file = YAML.safe_load File.open(FILE)
    end

    def dictionary
      load_file.fetch('dictionary', {})
    end

    def update_timestamps!
      Word.update_timestamps!
      Result.update_timestamps!
    end
  end
end
