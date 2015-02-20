class User::AccountAccess < BaseAccess
  def destroy?(account)
    not (current_user == account and current_user.is_admin?)
  end
end
