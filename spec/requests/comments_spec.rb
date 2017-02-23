require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  before(:each) do
    @user = FactoryGirl.create :user
    @auth_headers = @user.create_new_auth_token
  end

  it "Ticket create API should create ticket and return the ticket as response" do
    ticket = @user.tickets.create(title: "Sample" ,  description: "Test description")
    description = "test comment"
    post comments_path,params: {ticket_id: ticket.id,comment: {description: description}}, headers: @auth_headers
    json = JSON.parse(response.body)
    expect(json["description"]).to eq(description)
    expect(json["user"]["id"]).to eq(@user.id)
    expect(ticket.comments&.last&.id).to eq(json['id'])
  end

end