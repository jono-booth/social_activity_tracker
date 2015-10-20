class SocialNetwork
  include HTTParty

  def initialize args={}
    @url = args.fetch(:url)
    p "Tracking URL: #{@url}"
  end

  def social_activity
    HTTParty.get(tracking_url, options)
  end

end
