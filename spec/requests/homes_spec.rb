require "rails_helper"

RSpec.describe "home", type: :request do
  describe "トップページ" do
    it "正常なレスポンスを返すこと" do
      get root_path
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end
  
  describe "とは？ページ" do
    it "正常なレスポンスを返すこと" do
      get home_about_path
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end

  describe "利用規約ページ" do
    it "正常なレスポンスを返すこと" do
      get test_path
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end
end
