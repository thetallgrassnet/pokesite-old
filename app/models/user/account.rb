class User::Account
  include Neo4j::ActiveNode

  # Database authenticatable
  property :email,              type: String, null: false, default: "", index: :exact, constraint: :unique
  property :encrypted_password, type: String, null: false, default: ""

  # Recoverable
  property :reset_password_token,   type: String, index: :exact, constraint: :unique
  property :reset_password_sent_at, type: DateTime

  # Rememberable
  property :remember_created_at, type: DateTime

  # Trackable
  property :sign_in_count,      type: Integer, null: false, default: 0
  property :current_sign_in_at, type: DateTime
  property :last_sign_in_at,    type: DateTime
  property :current_sign_in_ip, type: String
  property :last_sign_in_ip,    type: String

  # Confirmable
  property :confirmation_token,   type: String, index: :exact, constraint: :unique
  property :confirmed_at,         type: DateTime
  property :confirmation_sent_at, type: DateTime
  property :unconfirmed_email,    type: String

  # Timestamps
  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  property :username, type: String,  null: false, default: "", index: :exact, constraint: :unique
  property :is_admin, type: Boolean, null: false, default: false

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
