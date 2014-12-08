class User::Account < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true, format: {
    with: %r{\A\w+\Z},
    message: "may only contain letters (A-Z, a-z), numbers (0-9), and underscores (_)"
  }

  def to_param
    name
  end

  def to_s
    name
  end
end
