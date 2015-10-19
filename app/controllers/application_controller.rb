class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_with_access_token

  def authenticate_with_access_token
    authenticate_or_request_with_http_token do |token, options|
      true
    end
  end
end
