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
  end

  def delete
  end

  private

  def load_user_account
    @account = User::Account.find_by uuid: params[:id]
  end
end
