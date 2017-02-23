require "rails_helper"

RSpec.describe TicketsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tickets").to route_to("tickets#index")
    end

    it "routes to #show" do
      ticket = FactoryGirl.create(:ticket,user: FactoryGirl.build(:user))
      expect(:get => "/tickets/#{ticket.id}").to route_to("tickets#show",id: ticket.id.to_s)
    end
    it "routes to #create" do
      expect(:post => "/tickets").to route_to("tickets#create")
    end
    it "routes to #change_status via put" do
      ticket = FactoryGirl.create(:ticket,user: FactoryGirl.build(:user))
      expect(:put => "/tickets/#{ticket.id}/change_status").to route_to("tickets#change_status",id: ticket.id.to_s)
    end
  end
end
