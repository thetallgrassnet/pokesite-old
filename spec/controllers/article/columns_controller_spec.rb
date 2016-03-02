require 'rails_helper'

RSpec.describe Article::ColumnsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:column) { FactoryGirl.create(:article_column) }
    it "returns http success" do
      get :show, id: column.slug
      expect(response).to have_http_status(:success)
    end
  end

end
