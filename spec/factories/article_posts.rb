FactoryGirl.define do
  factory :article_post, class: 'Article::Post' do
    sequence(:headline) { |n| "Article #{n}" }
    subhead { headline }
    body { headline }
    is_featured false
    published_at "2016-02-28 02:04:06"
    author
    column { author.columns.first }

    trait :unpublished do
      published_at nil
    end

    trait :scheduled do
      published_at DateTime.now + 1.day
    end
  end
end
