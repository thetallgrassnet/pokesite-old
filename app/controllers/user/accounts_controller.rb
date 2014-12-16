class User::AccountsController < ApplicationController
  def show
    @account = User::Account.find_by_username!(params[:id])
  end
end
