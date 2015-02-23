require 'rails_helper'

RSpec.describe Admin::User::AccountsController, type: :controller do

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
    let(:user) { FactoryGirl.create(:user_account, confirmed_at: DateTime.now) }
    login_admin

    it "retrieves the user" do
      get :show, id: user.uuid
      expect(assigns(:account)).to eql(user)
    end
  end

end
