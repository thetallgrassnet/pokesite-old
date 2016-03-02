require 'rails_helper'

RSpec.describe Article::PostsController, type: :controller do
  ignore_authorization!

  describe "GET #show" do
    let(:post) { FactoryGirl.create(:article_post) }

    it "returns http success" do
      should_authorize_for :show, post
      get :show, column_id: post.column.slug, id: post.slug
      expect(response).to have_http_status(:success)
    end
  end

end
