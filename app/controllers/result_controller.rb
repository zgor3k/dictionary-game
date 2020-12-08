# frozen_string_literal: true

class ResultController < ApplicationController
  def index
    @results = Result.by_negatives
                     .includes(:word)
                     .limit(20)
  end
end
