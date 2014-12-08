class User::AccountsController < ApplicationController
  def show
    @account = User::Account.find_by_name!(params[:id])
  end
end
