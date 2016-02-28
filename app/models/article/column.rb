class Article::Column
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :name, type: String, null: false, default: "", constraint: :unique
  property :slug, type: String, null: false, default: "", constraint: :unique

  property :description, type: String, null: false, default: ""

  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  has_many :in, :writers, rel_class: :"User::Account::WritesFor"
  has_many :in, :posts, origin: :column, model_class: :"Article::Post"

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true, format: {
    with: %r{\A[0-9a-z-]+\Z},
    message: "may only contain lowercase letters (a-z), numbers (0-9), and dashes (-)"
  }

  validates :description, presence: true

  before_validation :slugify

  def to_param
    slug
  end

  def to_s
    name
  end

  private

  def slugify
    self.slug = name.parameterize
  end
end
