class Admin::ResourceController < Admin::BaseController
  class << self
    protected

    def resource(klass, resource)
      prepend_before_action do
        @klass = klass
        @resource = '@' + resource.to_s
      end
    end
  end

  before_action :authorize_manage_resource
  before_action :load_resource, except: [:index]

  def index
    instance_variable_set @resource.to_s.pluralize, @klass.all
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
    instance_variable_set @resource, @klass.find_by(uuid: params[:id])
  end

  def authorize_manage_resource
    authorize_manage(@klass)
  end
end
