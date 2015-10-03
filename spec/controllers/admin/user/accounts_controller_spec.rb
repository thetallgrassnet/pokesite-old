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
    login_admin

    context "updating a user" do
      let(:user) { FactoryGirl.create(:user_account, :confirmed) }

      context "with valid parameters" do
        let(:username) { FactoryGirl.generate(:username) }

        it "updates the user and redirects" do
          put :update, id: user.uuid, user_account: { username: username }
          user.reload
          expect(response).to have_http_status(:redirect)
          expect(user.username).to eql(username)
          expect(flash[:success]).to be_present
        end
      end

      context "with invalid parameters" do
        it "renders the edit form" do
          put :update, id: user.uuid, user_account: { username: "" }
          expect(response).not_to have_http_status(:redirect)
          expect(user.username).to eql(user.username)
          expect(assigns(:user_account)).to eql(user)
        end
      end
    end

    context "an admin user" do
      it "can't demote themselves" do
        put :update, id: subject.current_user.uuid, user_account: { is_admin: false }
        expect(response).to have_http_status(:redirect)
        expect(subject.current_user.is_admin).to be true
        expect(flash[:error]).to be_present
      end
    end
  end

  describe "DELETE destroy" do
    login_admin

    context "user" do
      let(:user) { FactoryGirl.create(:user_account, :confirmed) }

      it "deletes the user" do
        delete :destroy, id: user.uuid
        expect(response).to redirect_to action: :index
        expect(flash[:success]).to be_present
      end

      it "handles failure to delete" do
        expect_any_instance_of(User::Account).to receive(:destroy).and_return(false)
        delete :destroy, id: user.uuid
        expect(response).to redirect_to action: :show, id: user.uuid
        expect(flash[:error]).to be_present
      end
    end

    context "admin" do
      it "cannot delete themselves" do
        delete :destroy, id: subject.current_user.uuid
        expect(response).to have_http_status(:redirect)
        expect(flash[:error]).to be_present
        expect(assigns(:user_account)).to eql(subject.current_user)
      end
    end
  end

end
