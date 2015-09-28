require 'rails_helper'

RSpec.describe User::AccountsController, type: :controller do

  describe "GET show" do
    let(:user) { FactoryGirl.create(:user_account, :confirmed) }

    it "returns http success" do
      get :show, id: user.username
      expect(response).to have_http_status(:success)
    end
  end

end
