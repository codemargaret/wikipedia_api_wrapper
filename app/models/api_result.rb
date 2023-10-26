require "httparty"
require "redis"

class ApiResult
  attr_reader :redis_conn

  def initialize(redis_conn = Redis.new)
    @redis_conn = redis_conn
  end

  def most_viewed_articles(date)
    date_string = date.strftime("%Y/%m/%d")

    response = redis_conn.get(date_string)

    if response.nil?
      response = HTTParty.get("https://wikimedia.org/api/rest_v1/metrics/pageviews/top/en.wikipedia/all-access/#{date_string}")["items"][0]["articles"]

      trimmed_response = response.map do |article|
        title_and_views = article.slice("article", "views")
      end
      redis_conn.set(date_string, trimmed_response.to_json)
    else
      response = JSON.parse(response)
    end

    response
  end
end