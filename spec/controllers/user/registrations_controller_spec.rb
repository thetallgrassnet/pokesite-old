require 'rails_helper'

RSpec.describe User::RegistrationsController, type: :controller do

  describe "DELETE destroy" do
    context "user" do
      login_user

      it "does not raise Allowy::AccessDenied" do
        bypass_rescue
        expect { delete :destroy }.not_to raise_error
      end
    end

    context "admin" do
      login_admin

      it "raises Allowy::AccessDenied" do
        bypass_rescue
        expect { delete :destroy }.to raise_error(Allowy::AccessDenied)
      end
    end
  end

end
