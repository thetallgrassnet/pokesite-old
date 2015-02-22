class User::RegistrationsController < Devise::RegistrationsController
  def destroy
    authorize! :destroy, current_user
    super
  end
end
