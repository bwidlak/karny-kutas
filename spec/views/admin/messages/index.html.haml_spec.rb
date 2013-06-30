require 'spec_helper'

describe "admin/messages/index" do
	before(:each) do
		assign(:admin_messages, [
			stub_model(Message,
				:name => "Name",
				:target_email => "Target Email",
				:body => "Thats the simple message"
			),
			stub_model(Message,
				:name => "Name",
				:target_email => "Target Email",
				:body => "Thats the simple message"
			)
		]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of admin/messages" do
	render

	assert_select "tr>td", :text => "Name".to_s, :count => 2
	assert_select "tr>td", :text => "Target Email".to_s, :count => 2
	assert_select "tr>td", :text => "Thats the simple message".to_s, :count => 2
  end
end
