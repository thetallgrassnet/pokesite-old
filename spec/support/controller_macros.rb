module ControllerMacros
  def login_user
    before(:example) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user_account, :confirmed)
    end
  end

  def login_admin
    before(:example) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user_account, :is_admin, :confirmed)
    end
  end
end
