require 'rails_helper'

RSpec.describe User, type: :user do
  context "user " do
    it "is invalid without an email" do
      expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
    end
    it "is invalid without a password" do
      expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
    end

    it "minimum password should be 8 character" do
      expect(FactoryGirl.build(:user, password: '1234567')).not_to be_valid
    end
    it "should be saved it db if provided valid ifno" do
      user  = FactoryGirl.create(:user)
      expect(user.id).to be_present
    end
  end
end