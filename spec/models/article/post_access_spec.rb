require 'rails_helper'

RSpec.describe Article::PostAccess do
  let(:access) { Article::PostAccess.new double(current_user: FactoryGirl.build(:user_account)) }

  context "an admin user" do
    let(:admin_access) { Article::PostAccess.new double(current_user: FactoryGirl.build(:user_account, :is_admin)) }

    describe "#manage?" do
      subject { admin_access.manage? Article::Post }
      it { is_expected.to be true }
    end
  end

  context "an author" do
    let(:author_access) { Article::PostAccess.new double(current_user: FactoryGirl.create(:author)) }

    describe "#manage?" do
      subject { author_access.manage? Article::Post }
      it { is_expected.to be true }
    end
  end

  context "a published post" do
    let(:post) { FactoryGirl.create(:article_post) }

    describe "#show?" do
      subject { access.show? post }
      it { is_expected.to be true }
    end
  end

  context "an unpublished post" do
    let(:post) { FactoryGirl.create(:article_post, :unpublished) }

    describe "#show?" do
      subject { access.show? post }
      it { is_expected.to be false }
    end
  end

  context "a scheduled post" do
    let(:post) { FactoryGirl.create(:article_post, :scheduled) }

    describe "#show?" do
      subject { access.show? post }
      it { is_expected.to be false }
    end
  end
end
