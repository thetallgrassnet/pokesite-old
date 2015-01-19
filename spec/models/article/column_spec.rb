require 'rails_helper'

RSpec.describe Article::Column, type: :model do

  let(:column) { FactoryGirl.create(:article_column) }

  context "name" do
    it "is required" do
      d = FactoryGirl.build(:article_column, name: "")
      expect(d).to be_invalid
    end

    it "is unique" do
      name = "Unique Name Column"
      c = FactoryGirl.create(:article_column, name: name)
      d = FactoryGirl.build(:article_column, name: name)
      expect(c).to be_valid
      expect(d).to be_invalid
    end
  end

  context "slug" do
    it "is created from the name" do
      name = "Slugify Column"
      c = FactoryGirl.create(:article_column, name: name)
      expect(c.slug).to eql("slugify-column")
    end

    it "is unique" do
      name = "Unique Slug Column"
      c = FactoryGirl.create(:article_column, name: name)
      d = FactoryGirl.build(:article_column, name: name)
      expect(c).to be_valid
      expect(d).to be_invalid
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
end
