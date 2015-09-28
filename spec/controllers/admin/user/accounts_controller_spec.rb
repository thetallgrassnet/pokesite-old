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
    let(:user) { FactoryGirl.create(:user_account, :confirmed) }
    login_admin

    it "retrieves the user" do
      get :show, id: user.uuid
      expect(assigns(:user_account)).to eql(user)
    end
  end

  describe "GET edit" do
    let(:user) { FactoryGirl.create(:user_account, :confirmed) }
    login_admin

    it "retrieves the user" do
      get :edit, id: user.uuid
      expect(assigns(:user_account)).to eql(user)
    end
  end

  describe "PUT update" do
    let(:user) { FactoryGirl.create(:user_account, :confirmed) }
    let(:username) { FactoryGirl.generate(:username) }
    login_admin

    it "updates the user" do
      put :update, id: user.uuid, user_account: { username: username }
      user.reload
      expect(response).to have_http_status(:redirect)
      expect(user.username).to eql(username)
    end
  end

end
