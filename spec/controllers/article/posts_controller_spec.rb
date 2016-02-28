require 'rails_helper'

RSpec.describe Article::PostsController, type: :controller do

  describe "GET #show" do
    let(:post) { FactoryGirl.create(:article_post) }

    it "returns http success" do
      get :show, column_id: post.column.slug, id: post.slug
      expect(response).to have_http_status(:success)
    end
  end

end
