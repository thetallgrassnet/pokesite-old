class Article::Post 
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :headline,     type: String, null: false, default: "", constraint: :unique
  property :slug,         type: String, null: false, default: "", constraint: :unique
  property :subhead,      type: String, null: false, default: ""
  property :body,         type: String, null: false, default: ""
  property :is_featured,  type: Boolean, null: false, default: false
  property :published_at, type: DateTime

  has_one :out, :author, type: :author, model_class: :"User::Account"
  has_one :out, :column, type: :column, model_class: :"Article::Column"

  validates :headline, presence: true, uniqueness: true
  validates :slug,     presence: true, uniqueness: true, format: {
    with: %r{\A[0-9a-z-]+\Z},
    message: "may only contain lowercase letters (a-z), numbers (0-9), and dashes (-)"
  }
  
  validates :subhead, presence: true
  validates :body,    presence: true
  validates :author,  presence: true
  validates :column,  presence: true

  validate :author_writes_for_column, unless: -> { author.nil? }

  before_validation :slugify

  scope :published, -> { where('result_articlepost.published_at < {now}').params(now: DateTime.now.to_time.to_i) }

  def to_param
    slug
  end

  def to_s
    headline
  end

  private

  def author_writes_for_column
    errors.add(:column, "Author does not write for this column") unless author.columns.include? column
  end

  def slugify
    self.slug = headline.parameterize
  end
end
