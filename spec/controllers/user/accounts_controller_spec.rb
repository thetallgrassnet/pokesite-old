require 'rails_helper'

RSpec.describe User::AccountsController, type: :controller do

  describe "GET show" do
    context "a valid user" do
      let(:user) { FactoryGirl.create(:user_account, :confirmed) }
      subject { get :show, id: user.username }

      it { is_expected.to render_template :show }
    end

    context "a nonexistent user" do
      subject { get :show, id: "not_a_valid_user" }

      it { is_expected.to have_http_status 404 }
    end
  end

end
