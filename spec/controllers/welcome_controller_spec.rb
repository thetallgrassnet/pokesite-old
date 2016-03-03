require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET index" do
    subject { get :index }
    it { is_expected.to render_template :index }
  end

  describe "GET about" do
    subject { get :about }
    it { is_expected.to render_template :about }
  end

  describe "GET privacy" do
    subject { get :privacy }
    it { is_expected.to render_template :privacy }
  end

end
