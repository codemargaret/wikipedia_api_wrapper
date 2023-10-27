class ArticleStatsController < ApplicationController
  def show
    @article_stats_week = ArticleStats.new(params["title"], Date.today - 8, Date.today - 1).total_views_in_range.as_json

    @article_stats_month = ArticleStats.new(params["title"], Date.today - 31, Date.today - 1).total_views_in_range

    @biggest_day_in_month = 
    ArticleStats.new(params["title"], Date.today - 31, Date.today - 1).biggest_day_in_range
  end
end