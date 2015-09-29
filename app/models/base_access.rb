class BaseAccess
  include Allowy::AccessControl
  delegate :current_user, to: :context

  def destroy?(klass)
    manage?(klass)
  end

  def manage?(klass)
    current_user.is_admin?
  end
end
