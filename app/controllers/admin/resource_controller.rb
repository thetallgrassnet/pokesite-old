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
  before_action :load_resource, except: [:index, :new, :create]

  def index
    (redirect_to(action: :index) and return) if params[:page] == "1"
    instance_variable_set @resource_instance_var.pluralize, @klass.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    instance_variable_set @resource_instance_var, @klass.new
  end

  def create
    begin
      instance_variable_set @resource_instance_var, @klass.new
      instance_variable_get(@resource_instance_var).update_attributes resource_params
      instance_variable_get(@resource_instance_var).save!

      flash[:success] = "#{instance_variable_get(@resource_instance_var)} created successfully."
      redirect_to action: :show, id: instance_variable_get(@resource_instance_var).uuid
    rescue Neo4j::ActiveNode::Persistence::RecordInvalidError
      render :new
    end
  end

  def show
  end

  def edit
    begin
      authorize! :update, instance_variable_get(@resource_instance_var)
    rescue Allowy::AccessDenied
      flash[:error] = "You are not allowed to update #{resource}."
      redirect_to action: :show, id: instance_variable_get(@resource_instance_var).uuid
    end
  end

  def update
    begin
      resource = instance_variable_get(@resource_instance_var)
      authorize! :update, resource
      resource.update_attributes! resource_params

      flash[:success] = "#{resource} updated successfully."
      redirect_to action: :show, id: resource.uuid
    rescue Allowy::AccessDenied
      flash[:error] = "You are not allowed to update #{resource}."
      redirect_to action: :show, id: resource.uuid
    rescue Neo4j::ActiveNode::Persistence::RecordInvalidError
      render :edit
    end
  end

  def destroy
    begin
      authorize! :destroy, instance_variable_get(@resource_instance_var)
      name = instance_variable_get(@resource_instance_var).to_s

      if instance_variable_get(@resource_instance_var).destroy
        flash[:success] = "#{name} destroyed successfully."
        redirect_to action: :index
      else
        flash[:error] = "Could not destroy #{name}."
        redirect_to action: :show, id: instance_variable_get(@resource_instance_var).uuid
      end
    rescue Allowy::AccessDenied
      flash[:error] = "You are not allowed to destroy #{name}."
      redirect_to action: :show, id: instance_variable_get(@resource_instance_var).uuid
    end
  end

  private

  def load_resource
    instance_variable_set @resource_instance_var, @klass.find_by!(uuid: params[:id])
  end

  def authorize_manage_resource
    authorize_manage(@klass)
  end

  def resource_params
    params.require(@resource).permit(*@params)
  end
end
