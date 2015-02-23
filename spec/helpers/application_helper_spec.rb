require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "controller_classes" do
    it "returns the controller name" do
      allow(helper).to receive(:controller_path) { "test" }
      expect(helper.controller_classes).to eq("test")
    end

    it "concatenates the controller namespace and name" do
      allow(helper).to receive(:controller_path) { "foo/bar" }
      expect(helper.controller_classes).to eq("foo bar")
    end
  end

  describe "join_title" do
    it "concatenates arguments" do
      expect(helper.join_title(["foo", "bar", "baz"])).to eq("foo | bar | baz")
    end
  end
end
