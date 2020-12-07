class Word < ApplicationRecord
  include Loadable

  has_one :result, dependent: :destroy

  class << self
    def create_results!
      return true if word_ids_for_results.blank?

      Result.upsert_all(word_ids_for_results, unique_by: 'index_results_on_word_id')
    end

    private

    def word_ids_for_results
      where(created_at: nil)&.map { |word| { word_id: word.id } }
    end
  end
end
