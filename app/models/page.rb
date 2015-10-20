class Page < ActiveRecord::Base
  has_many :social_activities, dependent: :destroy

  validates :url, uniqueness: true
  validates :url, :uuid, presence: true

  scope :top, ->(n) { order('score DESC').limit(n) }

  NETWORKS = [Facebook, Twitter]

  def track_social_activity
    NETWORKS.each do |network|
      network.new(url: self.url).stats.each do |fb_stat|
        if weighting = Weighting.where(network: network.to_s, field: fb_stat[:key]).first
          social_activities.create_with(value: fb_stat[:value]).find_or_create_by(weighting: weighting)
        end
      end
    end
  end

  def update_score
    score = social_activities.map { |activity|
      activity.weighting.value * activity.value
    }.sum

    update(score: score)
  end
end
