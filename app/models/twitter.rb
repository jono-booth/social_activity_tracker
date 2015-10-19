class Twitter < SocialNetwork
  def tracking_url
    "http://cdn.api.twitter.com/1/urls/count.json"
  end

  def options
    { url: @url }
  end

  def stats
    JSON.parse(social_activity).map { |array| { key: array.first, value: array.second } }
  end
end
