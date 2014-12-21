module ControllerMacros
  def login_user
    before(:example) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user_account)
      user.confirm!
      sign_in user
    end
  end
end
