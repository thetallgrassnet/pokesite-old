class User::AccountsController < ApplicationController
  def show
    @account = User::Account.find_by username: params[:id]
  end
end
