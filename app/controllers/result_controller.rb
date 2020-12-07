class ResultController < ApplicationController
  def index
    @results = Result.by_count(:asc).includes(:word)
  end
end
