require "spec_helper"

describe Admin::MessagesController do
	describe "routing" do

		it "routes to #index" do
			get("/admin/messages").should route_to("admin/messages#index")
		end

		it "routes to #show" do
			get("/admin/messages/1").should route_to("admin/messages#show", :id => "1")
		end

		it "routes to #destroy" do
			delete("/admin/messages/1").should route_to("admin/messages#destroy", :id => "1")
		end

	end
end
