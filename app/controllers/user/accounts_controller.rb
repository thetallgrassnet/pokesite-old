class User::AccountsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource find_by: :username

  def show
  end
end
