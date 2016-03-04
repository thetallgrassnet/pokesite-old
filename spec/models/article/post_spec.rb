require 'rails_helper'

RSpec.describe Article::Post, type: :model do
  let(:post) { FactoryGirl.create(:article_post) }

  describe ".published" do
    let(:unpublished) { FactoryGirl.create(:article_post, :unpublished) }
    let(:scheduled) { FactoryGirl.create(:article_post, :scheduled) }

    it "only returns published posts" do
      expect(Article::Post.as(:p).published(:p).all?(&:published?)).to be true
      expect { unpublished.update_attribute! :published_at, DateTime.now }.to change { Article::Post.as(:p).published(:p).count }.by 1
    end

    it "returns published posts in order" do
      p1 = FactoryGirl.create(:article_post, published_at: post.published_at - 1.day)
      p2 = FactoryGirl.create(:article_post, published_at: post.published_at - 2.day)

      expect(Article::Post.as(:p).published(:p)).to eq [post, p1, p2]
    end
  end

  context "headline" do
    it "is required" do
      post.headline = ""
      expect(post).to be_invalid
    end

    it "is unique" do
      p = FactoryGirl.build(:article_post, headline: post.headline)
      expect(p).to be_invalid
    end
  end

  context "slug" do
    it "is created from the headline" do
      headline = "Slugify Post"
      p = FactoryGirl.create(:article_post, headline: headline)
      expect(p.slug).to eql("slugify-post")
    end

    it "is unique" do
      p = FactoryGirl.build(:article_post, slug: post.slug)
      expect(p).to be_invalid
    end
  end

  context "subhead" do
    it "is required" do
      post.subhead = ""
      expect(post).to be_invalid
    end
  end

  context "body" do
    it "is required" do
      post.body = ""
      expect(post).to be_invalid
    end
  end

  context "author" do
    it "is required" do
      post.author = nil
      expect(post).to be_invalid
    end

    it "must write for the column" do
      u = FactoryGirl.create(:user_account)
      expect(post.column.writers).not_to include(u)

      post.author = u
      expect(post).to be_invalid
    end
  end

  context "column" do
    it "is required" do
      post.column = nil
      expect(post).to be_invalid
    end

    it "must be on the author's list of columns" do
      c = FactoryGirl.create(:article_column)
      expect(post.author.columns).not_to include(c)

      post.column = c
      expect(post).to be_invalid
    end
  end

  context "to_param" do
    it "returns the slug" do
      expect(post.to_param).to eql(post.slug)
    end
  end

  context "to_s" do
    it "returns the headline" do
      expect(post.to_s).to eql(post.headline)
    end
  end

  describe "published?" do
    it "returns true if the post is published" do
      expect(post.published?).to be true
    end

    it "returns false if the post is unpublished" do
      p = FactoryGirl.create(:article_post, :unpublished)
      expect(p.published?).to be false
    end

    it "returns false if the post is scheduled" do
      p = FactoryGirl.create(:article_post, :scheduled)
      expect(p.published?).to be false
    end
  end
end
