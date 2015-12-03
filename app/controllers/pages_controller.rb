class PagesController < ApplicationController

  http_basic_authenticate_with name: Rails.application.secrets.http_basic_user,
                               password: Rails.application.secrets.http_basic_password

  def stat
    begin
      page.track_social_activity if page.updated_at > 5.minutes.ago
      page.social_activities.create(social_activity)
      page.update(score: page.calculated_score)
      render json: page, status: :created
    rescue
      render json: {}, status: :unprocessible_entity
    end
  end

  def score
    if pages = Page.where(uuid: params[:uuid])
      render json: pages, status: :okay
    else
      render json: {}, status: :not_found
    end
  end

  def popular
    pages = Page.top(params[:size])
    render json: pages, status: :okay
  end

  private
  def page
    @page ||= Page.find_or_create_by(uuid: params[:uuid]) do |page|
      page.url = params[:url]
    end
  end

  def weighting
    Weighting.find_by_field(params[:stat_type])
  end

  def social_activity
    { value: 1, weighting: weighting, user_ip: params[:user_ip]}
  end

end
