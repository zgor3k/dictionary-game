# frozen_string_literal: true

class Result < ApplicationRecord
  include Loadable

  belongs_to :word

  scope :by_negatives, -> { order({ negatives: :desc }) }
  scope :by_count, -> { order(Arel.sql('negatives + positives asc')) }

  def count
    negatives + positives
  end
end
