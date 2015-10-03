require 'rails_helper'

RSpec.describe Admin::User::AccountsController, type: :controller do

  describe "GET index" do
    subject { get :index }

    context "authenticated" do
      login_admin
      it { is_expected.to have_http_status :success }

      it "assigns @user_accounts" do
        subject
        expect(assigns(:user_accounts).size).to be 1
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

  describe "GET show" do
    login_admin
    let(:user) { FactoryGirl.create(:user_account, :confirmed) }
    subject { get :show, id: user.uuid }

    it "retrieves the user" do
      subject
      expect(assigns(:user_account)).to eql(user)
    end
  end

  describe "GET edit" do
    login_admin
    let(:user) { FactoryGirl.create(:user_account, :confirmed) }
    subject { get :edit, id: user.uuid }

    it "retrieves the user" do
      subject
      expect(assigns(:user_account)).to eql(user)
    end
  end

  describe "PUT update" do
    login_admin

    context "a user" do
      let(:user) { FactoryGirl.create(:user_account, :confirmed) }

      context "with valid parameters" do
        let(:username) { FactoryGirl.generate(:username) }
        subject { put :update, id: user.uuid, user_account: { username: username } }

        it { is_expected.to redirect_to action: :show, id: user.uuid }

        it "updates the user" do
          subject
          user.reload
          expect(user.username).to eql(username)
        end

        it "displays a success message" do
          subject
          expect(flash[:success]).to be_present
        end
      end

      context "with invalid parameters" do
        subject { put :update, id: user.uuid, user_account: { username: "" } }

        it { is_expected.to render_template :edit }

        it "does not update the user" do
          subject
          user.reload
          expect(user.username).to eql(user.username)
        end
      end
    end

    context "an admin user attempting to demote themself" do
      subject { put :update, id: controller.current_user.uuid, user_account: { is_admin: false } }

      it { is_expected.to redirect_to action: :edit, id: controller.current_user.uuid }

      it "can't demote themself" do
        subject
        expect(controller.current_user.is_admin).to be true
      end

      it "displays an error message" do
        subject
        expect(flash[:error]).to be_present
      end
    end
  end

  describe "DELETE destroy" do
    login_admin

    context "user" do
      let(:user) { FactoryGirl.create(:user_account, :confirmed) }
      subject { delete :destroy, id: user.uuid }

      it { is_expected.to redirect_to action: :index }

      it "displays a success message" do
        subject
        expect(flash[:success]).to be_present
      end

      context "that cannot be deleted" do
        before { expect_any_instance_of(User::Account).to receive(:destroy).and_return(false) }

        it { is_expected.to redirect_to action: :show, id: user.uuid }

        it "displays an error message" do
          subject
          expect(flash[:error]).to be_present
        end
      end
    end

    context "admin attempting to delete themself" do
      subject { delete :destroy, id: controller.current_user.uuid }

      it { is_expected.to redirect_to action: :show, id: controller.current_user.uuid }

      it "displays an error message" do
        subject
        expect(flash[:error]).to be_present
      end
    end
  end

end
