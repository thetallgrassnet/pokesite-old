require 'rails_helper'

RSpec.describe Article::Post, type: :model do
  let(:post) { FactoryGirl.create(:article_post) }

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

  context "published" do
    describe ".published" do
      subject { Article::Post.published(:result_articlepost) }
      it { is_expected.to contain_exactly post }
    end
  end

  context "unpublished" do
    let(:p) { FactoryGirl.create(:article_post, :unpublished) }
    describe ".published" do
      subject { Article::Post.published(:result_articlepost) }
      it { is_expected.not_to include p }
    end
  end

  context "scheduled" do
    let(:p) { FactoryGirl.create(:article_post, :scheduled) }
    describe ".published" do
      subject { Article::Post.published(:result_articlepost) }
      it { is_expected.not_to include p }
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
end
