require 'rails_helper'

RSpec.describe Article::Column, type: :model do
  let(:column) { FactoryGirl.create(:article_column) }

  context "name" do
    it "is required" do
      c = FactoryGirl.build(:article_column, name: "")
      expect(c).to be_invalid
    end

    it "is unique" do
      c = FactoryGirl.build(:article_column, name: column.name)
      expect(c).to be_invalid
    end
  end

  context "slug" do
    it "is created from the name" do
      name = "Slugify Column"
      c = FactoryGirl.create(:article_column, name: name)
      expect(c.slug).to eql("slugify-column")
    end

    it "is unique" do
      c = FactoryGirl.build(:article_column, name: column.name)
      expect(c).to be_invalid
    end
  end

  context "description" do
    it "is required" do
      d = FactoryGirl.build(:article_column, description: "")
      expect(d).to be_invalid
    end
  end

  context "to_param" do
    it "returns the slug" do
      expect(column.to_param).to eql(column.slug)
    end
  end

  context "to_s" do
    it "returns the name" do
      expect(column.to_s).to eql(column.name)
    end
  end

  context "with writers" do
    let(:user) { FactoryGirl.create(:user_account) }
    before { column.writers << user }

    describe "#writers" do
      subject { column.writers.to_a }
      it { is_expected.to contain_exactly user }
    end
  end

  context "without writers" do
    describe "#writers" do
      subject { column.writers.to_a }
      it { is_expected.to be_empty }
    end
  end
end
