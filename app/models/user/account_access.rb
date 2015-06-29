class User::AccountAccess < BaseAccess
  def demote?(account)
    current_user.is_admin? and not current_user == account
  end

  def destroy?(account)
    not (current_user == account and current_user.is_admin?)
  end
end
