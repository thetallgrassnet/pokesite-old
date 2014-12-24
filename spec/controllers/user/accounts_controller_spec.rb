require 'rails_helper'

RSpec.describe User::AccountsController, type: :controller do

  describe "GET show" do
    let(:user) { FactoryGirl.create(:user_account, confirmed_at: DateTime.now) }

    context "authenticated" do
      login_user

      it "returns http success" do
        get :show, id: user.username
        expect(response).to have_http_status(:success)
      end
    end

    context "unauthenticated" do
      it "returns http redirect" do
        get :show, id: user.username
        expect(response).to have_http_status(:redirect)
      end
    end
  end

end
