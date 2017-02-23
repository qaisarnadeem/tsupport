require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "Comment " do
    it "is invalid without a description" do
      expect(FactoryGirl.build(:comment, description: nil)).not_to be_valid
    end
    it "is invalid without user" do
      ticket = FactoryGirl.build(:ticket)
      expect(FactoryGirl.build(:comment, user: nil , ticket: ticket)).not_to be_valid
    end
    it "is invalid without a ticket" do
      user = FactoryGirl.create(:user)
      expect(FactoryGirl.build(:comment, user: user)).not_to be_valid
    end

    it "is created when provided valid attributes" do
      user  = FactoryGirl.create(:user)
      ticket  =  FactoryGirl.create(:ticket,user: user)
      prior_count  = Comment.count
      comment = FactoryGirl.create(:comment,user: user,ticket: ticket)
      expect(Comment.count).to be_equal(prior_count + 1)
    end
  end
end