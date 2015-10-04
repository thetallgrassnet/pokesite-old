class User::Account::WritesFor
  include Neo4j::ActiveRel

  from_class User::Account
  to_class Article::Column
  type :writes_for

  property :is_editor, type: Boolean, null: false, default: false
end
