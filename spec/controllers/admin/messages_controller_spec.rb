require 'spec_helper'

describe Admin::MessagesController do

	# This should return the minimal set of attributes required to create a valid
	# Admin::Message. As you add validations to Admin::Message, be sure to
	# adjust the attributes here as well.
	let(:valid_attributes) { { "name" => "Honest John", "target_name" => "Jenna", "target_email" => "jenna@example.com", "body" => "oh thats not cool when you left me"} }

	# This should return the minimal set of values that should be in the session
	# in order to pass any filters (e.g. authentication) defined in
	# Admin::MessagesController. Be sure to keep this updated too.
	let(:valid_session) { {} }

	describe "GET index" do
		it "assigns all admin_messages as @admin_messages" do
			message = Message.create! valid_attributes
			get :index, {}, valid_session
			assigns(:admin_messages).should eq([message])
		end
	end

	describe "GET show" do
		it "assigns the requested admin_message as @admin_message" do
			message = Message.create! valid_attributes
			get :show, {:id => message.to_param}, valid_session
			assigns(:admin_message).should eq(message)
		end
	end

	describe "DELETE destroy" do
		it "destroys the requested admin_message" do
			message = Message.create! valid_attributes
			expect {
				delete :destroy, {:id => message.to_param}, valid_session
			}.to change(Message, :count).by(-1)
		end

		it "redirects to the admin_messages list" do
			message = Message.create! valid_attributes
			delete :destroy, {:id => message.to_param}, valid_session
			response.should redirect_to(admin_messages_url)
		end
	end

end
