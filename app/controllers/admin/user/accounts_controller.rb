class Admin::User::AccountsController < Admin::ResourceController
  resource ::User::Account, %w( username email password password_confirmation is_admin )

  def update
    begin
      authorize! :demote, @user_account if @user_account.is_admin? and params[:user_account][:is_admin] == false
      super
    rescue Allowy::AccessDenied
      flash[:error] = "You cannot demote your own admin account."
      redirect_to action: :edit, id: @user_account.uuid
    end
  end

  private

  def resource_params
    if params[:user_account][:password].blank? && params[:user_account][:password_confirmation].blank?
      params[:user_account].delete(:password)
      params[:user_account].delete(:password_confirmation)
    end

    super
  end
end
