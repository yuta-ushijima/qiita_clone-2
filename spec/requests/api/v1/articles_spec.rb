require "rails_helper"

RSpec.describe "Articles", type: :request do
  describe "GET /articles" do
    subject { get(api_v1_articles_path) }

    before do
      create_list(:article, 3)
    end

    it "articleの一覧が取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(res.length).to eq 3
      expect(res[0].keys).to eq ["id", "title", "content", "created_at", "updated_at", "user", "article_likes"]
      expect(response).to have_http_status(:ok)
    end
  end
end
