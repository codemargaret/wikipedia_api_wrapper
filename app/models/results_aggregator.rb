require "httparty"

class ResultsAggregator
  attr_reader :start_date, :end_date, :api_result

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
    @api_result = ApiResult.new
  end

  def most_viewed_articles
    most_viewed = (start_date..end_date).each_with_object({}) do |date, aggregate_results|
      articles = api_result.most_viewed_articles(date)

      articles.each do |article|
        title = article["article"]
        views = article["views"]

        current_views = aggregate_results[title] || 0

        aggregate_results[title] = current_views + views
      end
      
    end

    most_viewed.sort_by {|title, views| views}.reverse
  end
end