require 'rails_helper'

RSpec.describe Admin::Article::ColumnsController, type: :controller do

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

  describe "GET new" do
    login_admin

    it "instantiates a new column" do
      get :new
      expect(assigns(:article_column)).to be_a_new(Article::Column)
    end
  end

  describe "POST create" do
    login_admin

    context "with valid parameters" do
      let(:column) { FactoryGirl.build(:article_column) }
      subject { post :create, article_column: { name: column.name, description: column.description } }

      it "creates the column" do
        expect(subject).to redirect_to action: :show, id: assigns(:article_column).uuid
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid parameters" do
      let(:column) { FactoryGirl.build(:article_column, description: nil) }
      subject { post :create, article_column: { name: column.name, description: column.description } }

      it "doesn't create the column" do
        expect(subject).to render_template :new
      end
    end
  end

  describe "GET show" do
    let(:column) { FactoryGirl.create(:article_column) }
    login_admin

    it "retrieves the column" do
      get :show, id: column.uuid
      expect(assigns(:article_column)).to eql(column)
    end
  end

end
