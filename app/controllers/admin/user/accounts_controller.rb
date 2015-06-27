class Admin::User::AccountsController < Admin::BaseController
  before_action { authorize_manage(User::Account) }
  before_action :load_user_account, except: [:index]

  def index
    @accounts = User::Account.all
  end

  def show
  end

  def edit
  end

  def update
    begin
      if params[:user_account][:password].blank? && params[:user_account][:password_confirmation].blank?
        params[:user_account].delete(:password)
        params[:user_account].delete(:password_confirmation)
      end

      @account.update_attributes! params[:user_account]
      redirect_to admin_user_account_path(@account.uuid)
    rescue Exception => e
      render :edit
    end
  end

  def delete
  end

  private

  def load_user_account
    @account = User::Account.find_by uuid: params[:id]
  end
end
