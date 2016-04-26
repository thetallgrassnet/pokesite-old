class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_columns

  rescue_from Allowy::AccessDenied do |e|
    redirect_to root_url, flash: { error: t("common.not_authorized") }
  end

  rescue_from Neo4j::ActiveNode::Labels::RecordNotFound, with: :not_found

  def not_found
    respond_to do |format|
      format.html { render "errors/not_found", status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def load_columns
    @columns = Article::Column.all
  end
end
