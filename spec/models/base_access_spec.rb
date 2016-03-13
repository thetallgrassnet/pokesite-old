require 'rails_helper'

RSpec.describe BaseAccess do
  context "for an admin" do
    let(:admin_access) { BaseAccess.new double(current_user: FactoryGirl.build(:user_account, :is_admin)) }

    describe "#update?" do
      subject { admin_access.update? nil }
      it { is_expected.to be true }
    end

    describe "#destroy?" do
      subject { admin_access.destroy? nil }
      it { is_expected.to be true }
    end

    describe "#manage?" do
      subject { admin_access.manage? nil }
      it { is_expected.to be true }
    end
  end

  context "for a non-admin" do
    let(:access) { BaseAccess.new double(current_user: FactoryGirl.build(:user_account)) }

    describe "#update?" do
      subject { access.update? nil }
      it { is_expected.to be false }
    end

    describe "#destroy?" do
      subject { access.destroy? nil }
      it { is_expected.to be false }
    end

    describe "#manage?" do
      subject { access.manage? nil }
      it { is_expected.to be false }
    end
  end
end
