class ArticleStatsTest < ActiveSupport::TestCase
  Redis.new.flushdb

  start_date = Date.new(2023, 9, 3)
  end_date = Date.new(2023, 9, 4)

  article_stats = ArticleStats.new("Main_Page", start_date, end_date)

  test "returns a hash of dates and view for an article" do
    api_results = article_stats.article_api_results

    assert api_results == {start_date=>4551715, end_date=>4804185}
  end

  test "returns the total views of an article for a time period" do
    total_views = article_stats.total_views_in_range

    assert total_views == 9355900
  end

  test "returns the day in a range where an article got the most page views" do
    biggest_day = article_stats.biggest_day_in_range

    assert biggest_day = [end_date, 4979774]
  end
end