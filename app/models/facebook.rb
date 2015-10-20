class Facebook < SocialNetwork

  def tracking_url
    "https://api.facebook.com/method/links.getStats"
  end

  def options
    { query: { urls: @url, format: 'json' } }
  end

  def stats
    if activity = JSON.parse(social_activity).first
      activity.map { |array| { key: array.first, value: array.second } }
    else
      {}
    end
  end
end
