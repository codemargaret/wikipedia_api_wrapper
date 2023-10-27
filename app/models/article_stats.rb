require "httparty"
require "redis"

class ArticleStats
  attr_reader :title, :start_date, :end_date, :api_result

  def initialize(title, start_date, end_date)
    @title = title
    @start_date = start_date
    @end_date = end_date
    @api_result = ApiResult.new
  end

  def article_api_results # hash of dates and views
    @article_api_results ||= (start_date..end_date).each_with_object({}) do |date, results|
      
      articles = api_result.most_viewed_articles(date)

      articles.each do |article|
        if article["article"] == title
          results[date] = article["views"]
          break
        end
      end
    end
  end

  def total_views_in_range
    total_views = 0
  
    article_api_results.each do |date, views|
      total_views = total_views + views
    end

    total_views
  end

  def biggest_day_in_range
    biggest_day = article_api_results.max_by{|date, views| views}

    biggest_day
  end
end