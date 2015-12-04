class PagesController < ApplicationController

  unless Rails.env.test?
    http_basic_authenticate_with name: Rails.application.secrets.http_basic_user,
                                 password: Rails.application.secrets.http_basic_password
  end

  def stat
    begin
      SocialActivities.create(page: page, social_activity)
      page.update(score: page.calculated_score)

      if params[:stat_type] == 'page_view' && page.updated_at > 5.minutes.ago
        page.delay.track_social_activity
      end

      render json: page, status: :created
    rescue
      render json: {}, status: :unprocessible_entity
    end
  end

  def score
    if page = Page.where(uuid: params[:uuid])
      render json: page, status: :okay
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
