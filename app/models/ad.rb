class Ad
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :name,       type: String, null: false, constraint: :unique
  property :start_date, type: Date
  property :end_date,   type: Date
  property :is_active,  type: Boolean
  property :body,       type: String, null: false

  validates :name, presence: true, uniqueness: true
  validates :body, presence: true

  scope :active, ->(identifier) {
    where("#{identifier}.is_active = {true} AND #{identifier}.start_date <= {today} AND #{identifier}.end_date >= {today}")
      .params(true: true, today: Date.today.to_time.to_i)
  }

  def self.pick_random
    active(:a)
      .query_as(:a)
      .with(a: :a, rand: "rand()")
      .order(:rand)
      .proxy_as(Ad, :a)
      .limit(1)
      .pluck(:a)
      .first
  end

  def to_s
    name
  end
end
