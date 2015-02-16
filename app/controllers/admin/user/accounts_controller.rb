class Admin::User::AccountsController < Admin::BaseController
  load_and_authorize_resource class: "User::Account", find_by: :uuid

  def index
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
