class Twitter < SocialNetwork
  def tracking_url
    "http://cdn.api.twitter.com/1/urls/count.json"
  end

  def options
    { query: { url: @url } }
  end

  def stats
    JSON.parse(social_activity.body).map { |array| { key: array.first, value: array.second } }
  end
end
