class Result < ApplicationRecord
  include Loadable

  belongs_to :word

  scope :by_count, -> (order_by) {
    select('*, coalesce(negatives, positives) as count')
      .order("count #{order_by}")
  }

  def count
    negatives + positives
  end
end
