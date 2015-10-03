class User::AccountAccess < BaseAccess
  def demote?(account)
    current_user.is_admin? and not current_user == account
  end

  def destroy?(account)
    return false if current_user == account and current_user.is_admin?
    current_user == account or super
  end
end
