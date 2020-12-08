# frozen_string_literal: true

class Result < ApplicationRecord
  include Loadable

  belongs_to :word

  scope :by_negatives, -> { order({ negatives: :desc }, 'negatives + positives desc') }

  def count
    negatives + positives
  end
end
