class Admin::BaseController < ApplicationController
  before_action :authorize_admin

  protected

  def authorize_admin
    raise Allowy::AccessDenied.new("Not authorized", nil, nil, nil) unless current_user.try(:can_access_admin?)
  end
end
