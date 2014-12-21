class User::Account
  include Neo4j::ActiveNode

  property 

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
    format: {
      with: %r{\A\w+\Z},
      message: "may only contain letters (A-Z, a-z), numbers (0-9), and underscores (_)"
    },
    fuzzy_obscenity: true,
    presence: true,
    uniqueness: true

  def to_param
    username
  end

  def to_s
    username
  end

  def can_access_admin?
    is_admin?
  end
end
