class Admin::ResourceController < Admin::BaseController
  class << self
    protected

    def resource(klass, params)
      prepend_before_action do
        @klass = klass
        @resource = @klass.name.underscore.gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
        @resource_instance_var = '@' + @resource
        @params = params
      end
    end
  end

  before_action :authorize_manage_resource
  before_action :load_resource, except: [:index]

  def index
    instance_variable_set @resource_instance_var.to_s.pluralize, @klass.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def load_resource
    instance_variable_set @resource_instance_var, @klass.find_by(uuid: params[:id])
  end

  def authorize_manage_resource
    authorize_manage(@klass)
  end

  def resource_params
    params.require(@resource).permit(*@params)
  end
end
