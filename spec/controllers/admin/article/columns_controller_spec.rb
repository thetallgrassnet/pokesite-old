require 'rails_helper'

RSpec.describe Admin::Article::ColumnsController, type: :controller do

  describe "GET index" do
    subject { get :index }

    context "authenticated" do
      login_admin
      let(:columns) { FactoryGirl.create_list(:article_column, 5) }
      it { is_expected.to have_http_status :success }

      it "assigns @article_columns" do
        subject
        expect(assigns(:article_columns)).to match_array columns
      end
    end

    context "unauthenticated" do
      it { is_expected.to redirect_to '/' }
    end

    context "unauthorized" do
      login_user
      it { is_expected.to redirect_to '/' }
    end
  end

  describe "GET new" do
    login_admin
    before { get :new }
    subject { assigns(:article_column) }

    it { is_expected.to be_a_new Article::Column }
  end

  describe "POST create" do
    login_admin

    context "with valid parameters" do
      let(:column) { FactoryGirl.build(:article_column) }
      subject { post :create, article_column: { name: column.name, description: column.description } }

      it { is_expected.to redirect_to action: :show, id: assigns(:article_column).uuid }

      it "displays an success message" do
        subject
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid parameters" do
      let(:column) { FactoryGirl.build(:article_column, description: nil) }
      subject { post :create, article_column: { name: column.name, description: column.description } }

      it { is_expected.to render_template :new }
    end
  end

  describe "GET show" do
    login_admin
    let(:column) { FactoryGirl.create(:article_column) }
    subject { get :show, id: column.uuid }

    it "retrieves the column" do
      subject
      expect(assigns(:article_column)).to eql(column)
    end
  end

end
