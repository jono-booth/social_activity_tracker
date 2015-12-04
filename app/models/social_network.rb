class SocialNetwork
  include HTTParty

  def initialize args={}
    @url = args.fetch(:url)
    p "Tracking URL: #{@url}"
  end

  def request
    HTTParty.get(tracking_url, options)
  end

  def social_activity
    if response.code == 200
      request.body
    end
  end

end
