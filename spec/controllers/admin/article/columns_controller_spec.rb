require 'rails_helper'

RSpec.describe Admin::Article::ColumnsController, type: :controller do

  describe "GET index" do
    context "authenticated" do
      login_admin

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context "unauthenticated" do
      it "returns http redirect" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end

    context "unauthorized" do
      login_user

      it "reutrns http redirect" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "GET show" do
    let(:column) { FactoryGirl.create(:article_column) }
    login_admin

    it "retrieves the column" do
      get :show, id: column.uuid
      expect(assigns(:article_column)).to eql(column)
    end
  end

end
