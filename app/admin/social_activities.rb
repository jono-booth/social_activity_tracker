ActiveAdmin.register SocialActivity do
  actions :index

  index do
    column :network do |activity| activity.weighting.network end
    column :stat_type do |activity| activity.weighting.field end
    column :value
    column :url do |activity| activity.page.url end
    column :user_ip
  end
end
