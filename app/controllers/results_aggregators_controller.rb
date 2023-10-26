class ResultsAggregatorsController < ApplicationController
  def most_viewed_last_week
    @results_aggregator_week = ResultsAggregator.new(Date.today - 8, Date.today - 1).most_viewed_articles.as_json
  end

  def most_viewed_last_month
    @results_aggregator_month = ResultsAggregator.new(Date.today - 31, Date.today - 1).most_viewed_articles.as_json
  end
end