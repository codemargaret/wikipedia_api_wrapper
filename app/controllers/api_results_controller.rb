class ApiResultsController < ApplicationController
  def index
    @api_result = ApiResult.new.most_viewed_articles(Date.yesterday)
  end
end