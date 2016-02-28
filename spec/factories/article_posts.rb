FactoryGirl.define do
  factory :article_post, class: 'Article::Post' do
    headline "MyString"
    subhead "MyString"
    body "MyString"
    is_featured false
    published_at "2016-02-28 02:04:06"
    author
    column { author.columns.first }
  end
end
