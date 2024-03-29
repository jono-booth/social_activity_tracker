class SocialActivity < ActiveRecord::Base
  belongs_to :page
  belongs_to :weighting

  validates :weighting, uniqueness: { scope: [:page, :user_ip] }
  validates :page, :weighting, :value, presence: true

end
