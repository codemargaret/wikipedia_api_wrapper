require "test_helper"
require "redis"

class ApiResultTest < ActiveSupport::TestCase
    Redis.new.flushdb

    date = Date.yesterday
    api_result = ApiResult.new.most_viewed_articles(date)

    test "returns a list of the most viewed articles for one day" do
      number_of_articles = api_result.count
  
      assert number_of_articles == 1000
    end
end