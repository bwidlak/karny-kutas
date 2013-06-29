require 'spec_helper'

describe "messages/show" do


  # before(:each) do
  #   @message = assign(:message, stub_model(Message,
  #     :name => "Honest John",
  #     :target_name => "Jenna",
  #     :target_email => "Target Email",
  #     :body => "oh thats not cool when you left me"
  #   ))
  # end

	it "renders attributes" do
		assign(:message, stub_model(Message,
			:name => "Honest John",
			:target_name => "Jenna",
			:target_email => "jenna@example.com",
			:body => "oh thats not cool when you left me"
			))

		render

		rendered.should	contain("Honest John")
		rendered.should	contain("Jenna")
		rendered.should	contain("jenna@example.com")
		rendered.should	contain("oh thats not cool when you left me")
	end
end
