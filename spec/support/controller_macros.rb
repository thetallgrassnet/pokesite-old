module ControllerMacros
  def login_user
    before(:example) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user_account, confirmed_at: DateTime.now)
    end
  end

  def login_admin
    before(:example) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:admin, confirmed_at: DateTime.now)
    end
  end
end
