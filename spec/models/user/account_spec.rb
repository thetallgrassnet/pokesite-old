require 'rails_helper'

RSpec.describe User::Account, type: :model do
  let(:user) { FactoryGirl.create(:user_account) }
  let(:admin) { FactoryGirl.create(:user_account, :is_admin) }

  context "username" do
    it "is required" do
      u = FactoryGirl.build(:user_account, username: "")
      expect(u).to be_invalid
    end

    it "is unique" do
      u = FactoryGirl.build(:user_account, username: user.username)
      expect(u).to be_invalid
    end

    it "may only contain letters, numbers, and underscores" do
      u = FactoryGirl.build(:user_account, username: "Invalid @Username")
      expect(u).to be_invalid
    end

    it "cannot be profane" do
      u = FactoryGirl.build(:user_account, username: "some_jackass")
      expect(u).to be_invalid
    end
  end

  context "to_param" do
    it "returns the username" do
      expect(user.to_param).to eql(user.username)
    end
  end

  context "to_s" do
    it "returns the username" do
      expect(user.to_s).to eql(user.username)
    end
  end

  context "can_access_admin?" do
    it "is true for admins" do
      expect(admin.can_access_admin?).to eql(true)
    end

    it "is false for non-admins" do
      expect(user.can_access_admin?).to eql(false)
    end
  end

  context "with columns" do
    let(:column) { FactoryGirl.create(:article_column) }
    before { user.columns << column }

    describe "#columns" do
      subject { user.columns.to_a }
      it { is_expected.to contain_exactly column }
    end

    describe "#can_access_admin?" do
      subject { user.can_access_admin? }
      it { is_expected.to be true }
    end

    context "with posts" do
      let(:post) { FactoryGirl.create(:article_post) }
 
      describe "#posts" do
        subject { post.author.posts.to_a }
        it { is_expected.to contain_exactly post }
      end
    end

    context "without posts" do
      describe "#posts" do
        subject { user.posts.to_a }
        it { is_expected.to be_empty }
      end
    end
  end

  context "without columns" do
    describe "#columns" do
      subject { user.columns.to_a }
      it { is_expected.to be_empty }
    end

    describe "#can_access_admin?" do
      subject { user.can_access_admin? }
      it { is_expected.to be false }
    end
  end
end
