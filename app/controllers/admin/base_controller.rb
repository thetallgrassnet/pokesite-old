class Admin::BaseController < ApplicationController
  before_action :authorize_admin

  protected

  def authorize_admin
    authorize! :access, :admin
  end
end
