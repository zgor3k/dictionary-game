# frozen_string_literal: true

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
end
