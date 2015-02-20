class BaseAccess
  include Allowy::AccessControl
  delegate :current_user, to: :context

  def manage?(klass)
    current_user.is_admin?
  end
end
