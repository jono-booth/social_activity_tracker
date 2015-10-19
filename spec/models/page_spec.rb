require 'rails_helper'

describe Page do

  before do
    allow_any_instance_of(Facebook).to receive(:social_activity).and_return('[{"url":"platform45.com","normalized_url":"http:\/\/www.platform45.com\/","share_count":15,"like_count":35,"comment_count":19,"total_count":69,"click_count":0,"comments_fbid":"10150460653296902","commentsbox_count":0}]')
    allow_any_instance_of(Twitter).to receive(:social_activity).and_return('{"count":75,"url":"http:\/\/platform45.com\/"}')
  end

  let!(:weighting_a) { create(:weighting, value: 2, field: 'like_count', network: "Facebook") }
  let!(:weighting_b) { create(:weighting, value: 5, field: 'share_count', network: "Facebook") }
  let!(:weighting_c) { create(:weighting, value: 5, field: 'count', network: "Twitter") }
  let!(:weighting_d) { create(:weighting, value: 5, field: 'page_view', network: "Laugh") }

  let!(:page) { create(:page) }

  before :each do
    page.track_social_activity
  end

  describe '.fetch_social_activity' do
    it "should create a new entry if one doesn't exist" do
      expect(SocialActivity.all.size).to eq 3
    end

    it "should not create duplicate entries" do
      expect{ page.track_social_activity }.to change{ SocialActivity.all.size }.by 0
    end

    it "should save the values for the stats" do
      expect(page.social_activities.find_by(weighting: weighting_a).value).to eq 35
      expect(page.social_activities.find_by(weighting: weighting_b).value).to eq 15
      expect(page.social_activities.find_by(weighting: weighting_c).value).to eq 75
    end
  end

  describe '.update_score' do
    before :each do
      create_list(:laugh_page_view, 5, weighting: weighting_d, page: page)
      page.update_score
    end

    it "should be the product of the value and the weighting value" do
      expect(page.score).to eq 545
    end
  end

  describe '.top(n)' do

    let!(:page_last) { create(:page, score: 50) }
    let!(:page_third) { create(:page, score: 2000) }
    let!(:page_first) { create(:page, score: 50000) }
    let!(:page_second) { create(:page, score: 4000) }
    let!(:page_fourth) { create(:page, score: 300) }

    let(:top) { Page.top(3) }

    it "should return the top pages" do
      expect(top.size).to eq 3
    end

    it "should include the top n pages" do
      expect(top.first.score).to eq page_first.score
      expect(top.second.score).to eq page_second.score
      expect(top.third.score).to eq page_third.score
    end
  end
end
