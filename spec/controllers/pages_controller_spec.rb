require 'rails_helper'

describe PagesController do

  describe '#stat' do
    let!(:weighting_a) { create(:weighting, value: 50, field: 'entry', network: "Laugh") }
    let!(:weighting_b) { create(:weighting, value: 5, field: 'page_view', network: "Laugh") }

    let(:create_page) { post :stat, stat_type: weighting_a.field, url: "http://platform45.com", uuid: "0000", user_ip: "192.168.1.1"}
    let(:create_page_view) { post :stat, stat_type: weighting_b.field, url: "http://platform45.com", uuid: "0000", user_ip: "192.168.1.1" }
    let(:create_page_view_with_new_ip) { post :stat, stat_type: weighting_b.field, url: "http://platform45.com", uuid: "0000", user_ip: "192.168.1.2"}

    before :each do
      create_page
    end

    it "should create a page if it doesn't exist" do
      expect(Page.all.size).to eq 1
    end

    it "should create a page view activity" do
      expect(SocialActivity.all.size).to eq  1
      expect(Page.first.score).to eq 50
    end

    it "should not create a duplicate page" do
      expect{ create_page }.to change{ Page.all.size }.by 0
      expect(response.body).to include("\"score\":50")
    end

    it "should create a social activity for a page view" do
      create_page_view
      expect(Page.first.calculated_score).to eq 55
    end

    it "only create 1 page view per user ip" do
      create_page_view
      create_page_view
      create_page_view
      expect(Page.first.score).to eq 55

      create_page_view_with_new_ip
      expect(Page.first.score).to eq 60
    end
  end

  describe "#score" do
    let!(:page_a) { create(:page, score: 200) }
    let!(:page_b) { create(:page, score: 500) }

    it "should return the score for a page" do
      get :score, uuid: page_a.uuid
      expect(response.body).to include("\"score\":200")
    end

    it "should return a score for a set of pages" do
      get :score, uuid: [ page_a.uuid, page_b.uuid ]
      expect(response.body).to include("\"score\":200")
      expect(response.body).to include("\"score\":500")
    end
  end

  describe "#top" do
    let!(:page_a) { create(:page, score: 500) }
    let!(:page_b) { create(:page, score: 400) }
    let!(:page_c) { create(:page, score: 300) }
    let!(:page_d) { create(:page, score: 200) }
    let!(:page_e) { create(:page, score: 100) }

    it "should return the top n pages" do
      get :popular, size: 3
      expect(response.body).to include("\"score\":500")
      expect(response.body).to include("\"score\":400")
      expect(response.body).to include("\"score\":300")
      expect(response.body).to_not include("\"score\":200")
      expect(response.body).to_not include("\"score\":100")
    end
  end
end
