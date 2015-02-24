FactoryGirl.define do
  factory :article_column, class: 'Article::Column' do
    sequence(:name) { |n| "Column #{n}" }
    description { name }
  end

end
