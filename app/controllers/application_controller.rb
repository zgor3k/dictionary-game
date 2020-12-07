class ApplicationController < ActionController::Base
  def index
    @results = Result.by_count(:asc).includes(:word)
  end
end
