namespace :track do
  desc "Track social activity on all Pages"

  task pages: :environment do
    Page.all.each do |page|
      page.track_social_activity
      page.update_score
    end
  end
end
