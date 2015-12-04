class SocialNetwork
  include HTTParty

  def initialize args={}
    @url = args.fetch(:url)
    p "Tracking URL: #{@url}"
  end

  def social_activity
    if response.code == 200
      JSON.parse(response_body)
    else
      {}
    end
  end
end
