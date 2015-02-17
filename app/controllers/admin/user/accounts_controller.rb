class Admin::User::AccountsController < Admin::BaseController
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
