require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do

  describe "GET index" do
    subject { get :index }

    context "authenticated" do
      login_admin
      it { is_expected.to have_http_status :success }
    end

    context "unauthenticated" do
      it { is_expected.to redirect_to '/' }
    end

    context "unauthorized" do
      login_user
      it { is_expected.to redirect_to '/' }
    end
  end

end
