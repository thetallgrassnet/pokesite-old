require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET index" do
    let!(:posts) { FactoryGirl.create_list(:article_post, 8, :featured) }

    subject { get :index }

    it { assigns :posts }
    it { is_expected.to render_template :index }

    describe "@posts" do
      before { subject }

      it "contains 6 posts" do
        expect(assigns(:posts).count).to eql 6
      end

      it "contains only published posts" do
        expect(assigns(:posts).all?(&:published?)).to be true
      end

      it "contains only featured posts" do
        expect(assigns(:posts).all?(&:is_featured)).to be true
      end
    end
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
