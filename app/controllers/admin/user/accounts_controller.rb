class Admin::User::AccountsController < Admin::BaseController
  before_action { authorize_manage(User::Account) }

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
end
