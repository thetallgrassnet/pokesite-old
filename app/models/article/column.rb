class Article::Column
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  include Namekuji

  property :name, type: String, null: false, default: "", constraint: :unique
  property :slug, type: String, null: false, default: "", constraint: :unique

  property :description, type: String, null: false, default: ""

  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  has_many :in, :writers, rel_class: :"User::Account::WritesFor"
  has_many :in, :posts, origin: :column, model_class: :"Article::Post"

  validates :name, presence: true, uniqueness: true

  validates :description, presence: true

  sluggable on_field: :name

  def to_s
    name
  end
end
