class Facebook < SocialNetwork

  def tracking_url
    "https://api.facebook.com/method/links.getStats"
  end

  def options
    { urls: @url,
      format: 'json' }
  end

  def stats
    JSON.parse(social_activity).first.map { |array| { key: array.first, value: array.second } }
  end
end
