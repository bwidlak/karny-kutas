require "spec_helper"

describe MessagesController do
  describe "routing" do

    it "routes to #index" do
      get("/messages").should route_to("messages#index")
    end

    it "routes to #new" do
      get("/messages/new").should route_to("messages#new")
    end

    it "routes to #show" do
      get("/messages/1").should route_to("messages#show", :id => "1")
    end

    it "routes to #create" do
      post("/messages").should route_to("messages#create")
    end

    it "routes to searched email" do
      get("/messages/search").should route_to("messages#search")
    end
  end
end
