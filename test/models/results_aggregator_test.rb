require "test_helper"
require "date"

class ResultsAggregatorTest < ActiveSupport::TestCase
  Redis.new.flushdb

  start_date = Date.new(2023, 9, 3)
  end_date = Date.new(2023, 9, 4)

  test "returns a list of the most viewed articles for a period of time" do
    api_result = ResultsAggregator.new(start_date, end_date).most_viewed_articles
    number_of_articles = api_result.count

    assert number_of_articles > 1000
    assert api_result[0] == ["Main_Page", 9355900]
    assert api_result[1] == ["Special:Search", 2631923]
  end
end