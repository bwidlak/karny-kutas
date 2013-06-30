require 'spec_helper'

describe MessagesController do

	let(:valid_attributes) { { "name" => "Honest John", "target_name" => "Jenna", "target_email" => "jenna@example.com", "body" => "oh thats not cool when you left me"} }

	# This should return the minimal set of values that should be in the session
	# in order to pass any filters (e.g. authentication) defined in
	# MessagesController. Be sure to keep this updated too.
	let(:valid_session) { {} }

	describe "GET search" do
		it "assigns all messages as @messages for searched email" do
			message = Message.create! valid_attributes
			get :search, {}, valid_session
			expect(message.target_email).to eq('jenna@example.com')
		end

		it "should redirect to new message when searched email is not found" do
			message = Message.create! valid_attributes
			get :search, { "target_email" => "barto@gmail.com"}, valid_session
			response.should redirect_to(new_message_path)
		end
	end

	describe "GET index" do
		it "assigns all messages as @messages" do
			message = Message.create! valid_attributes
			get :index, {}, valid_session
			assigns(:messages).should eq([message])
		end
	end

	describe "GET show" do
		it "assigns the requested message as @message" do
			message = Message.create! valid_attributes
			get :show, {:id => message.to_param}, valid_session
			assigns(:message).should eq(message)
		end
	end

	describe "GET new" do
		it "assigns a new message as @message" do
			get :new, {}, valid_session
			assigns(:message).should be_a_new(Message)
		end
	end

	describe "POST create" do
		describe "with valid params" do
			it "creates a new Message" do
				expect {
					post :create, {:message => valid_attributes}, valid_session
				}.to change(Message, :count).by(1)
			end

			it "assigns a newly created message as @message" do
				post :create, {:message => valid_attributes}, valid_session
				assigns(:message).should be_a(Message)
				assigns(:message).should be_persisted
			end

			it "redirects to the created message" do
				post :create, {:message => valid_attributes}, valid_session
				response.should redirect_to(Message.last)
			end
		end

		describe "with invalid params" do
			it "assigns a newly created but unsaved message as @message" do
				# Trigger the behavior that occurs when invalid params are submitted
				Message.any_instance.stub(:save).and_return(false)
				post :create, {:message => { "name" => "invalid value" }}, valid_session
				assigns(:message).should be_a_new(Message)
			end

			it "re-renders the 'new' template" do
				# Trigger the behavior that occurs when invalid params are submitted
				Message.any_instance.stub(:save).and_return(false)
				post :create, {:message => { "name" => "invalid value" }}, valid_session
				response.should render_template("new")
			end
		end
	end

end
