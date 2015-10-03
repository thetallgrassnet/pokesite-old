require 'rails_helper'

RSpec.describe User::AccountsController, type: :controller do

  describe "GET show" do
    context "a valid user" do
      let(:user) { FactoryGirl.create(:user_account, :confirmed) }
      subject { get :show, id: user.username }

      it { is_expected.to render_template :show }
    end
    end
  end

end
