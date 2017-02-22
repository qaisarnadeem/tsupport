require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context "Ticket " do
    it "is invalid without a title" do
      FactoryGirl.build(:ticket, title: nil).should_not be_valid
    end
    it "is invalid without a description" do
      FactoryGirl.build(:ticket, description: nil,title: "Test title").should_not be_valid
    end

    it "is invalid without a user association" do
      FactoryGirl.build(:ticket, description: "Description",title: "Test title").should_not be_valid
    end

    it "is valid with all required field" do
      user = FactoryGirl.create(:user)
      ticket = FactoryGirl.build(:ticket, description: "Description",title: "Test title" , user: user)
      ticket.should be_valid
    end
    it "valid ticket should be saved" do
      user = FactoryGirl.create(:user)
      prior = Ticket.count
      ticket = FactoryGirl.create(:ticket, description: "Description",title: "Test title" , user: user)
      Ticket.count.should equal(prior + 1)
    end
  end
end
require "rails_helper"