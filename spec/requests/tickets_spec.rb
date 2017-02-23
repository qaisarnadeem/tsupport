require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  before(:each) do
    @user = FactoryGirl.create :user
    @auth_headers = @user.create_new_auth_token
  end

  describe "GET /tickets" do
    it "should return 200 response after successfull login" do
      get tickets_path,params: {}, headers: @auth_headers
      expect(response).to have_http_status(200)
    end
    it "should return 401 for invalid credentials" do
      get tickets_path,params: {}
      expect(response).to have_http_status(401)
    end

    it "should return ticket as json response for user who has tickets" do
      ticket = @user.tickets.create(title: "Sample" ,  description: "Test description")
      get tickets_path,params: {}, headers: @auth_headers
      json = JSON.parse(response.body)
      expect(json["tickets"].first['id']).to eq(ticket.id)
    end

    it "should return valid tickets count in response" do
      ticket = @user.tickets.create(title: "Sample" ,  description: "Test description")
      get tickets_path,params: {}, headers: @auth_headers
      json = JSON.parse(response.body)
      expect(json["total"]).to eq(1)
    end


    it "Ticket show api should return valid response with ticket as body" do
      ticket = @user.tickets.create(title: "Sample" ,  description: "Test description")
      get ticket_path(ticket),params: {}, headers: @auth_headers
      json = JSON.parse(response.body)
      expect(json["id"]).to eq(ticket.id)
      expect(json["title"]).to eq(ticket.title)
      expect(json["description"]).to eq(ticket.description)
    end

    it "Ticket create API should create ticket and return the ticket as response" do
      title = "Test"
      description = "sample description"
      post tickets_path,params: {ticket: {title: title , description: description}}, headers: @auth_headers
      json = JSON.parse(response.body)
      expect(json["title"]).to eq(title)
      expect(json["description"]).to eq(description)
      expect(json["user_id"]).to eq(@user.id)
    end

    it "change status ticket should change the status as provided" do
      ticket = @user.tickets.create(title: "Sample" ,  description: "Test description")
      put change_status_ticket_path(ticket),params: {status: "in_progress"}, headers: @auth_headers
      json = JSON.parse(response.body)
      expect(json["status"]).to eq("in_progress")
    end
  end
end
