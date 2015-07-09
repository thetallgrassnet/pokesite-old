class Admin::User::AccountsController < Admin::ResourceController
  resource User::Account, %w( username email password password_confirmation is_admin )

  def update
    begin
      authorize! :demote, @user_account if @user_account.is_admin? and params[:user_account][:is_admin] == false
      @user_account.update_attributes! resource_params

      flash[:success] = "#{@user_account} updated successfully."
      redirect_to action: :show, id: @user_account.uuid
    rescue Allowy::AccessDenied
      flash[:error] = "You cannot demote your own admin account."
      redirect_to action: :edit, id: @user_account.uuid
    rescue
      render :edit
    end
  end

  def delete
    begin
      authorize! :destroy, @user_account

      name = @user_account.to_s
      @user_account.destroy!

      flash[:success] = "#{name} deleted successfully."
      redirect_to action: :index
    rescue Allowy::AccessDenied
      flash[:error] = "You cannot delete your own admin account."
      redirect_to action: :show, id: @user_account.uuid
    rescue
      flash[:error] = "Could not delete #{@user_account}."
      redirect_to action: :show, id: @user_account.uuid
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
