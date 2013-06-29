require 'spec_helper'

describe "messages/index" do
  before(:each) do
    assign(:messages, [
      stub_model(Message,
        :name => "Name",
        :target_name => "Target Name",
        :target_email => "Target Email",
        :body => "Thats the simple message"
      ),
      stub_model(Message,
        :name => "Name",
        :target_name => "Target Name",
        :target_email => "Target Email",
        :body => "Thats the simple message"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Target Name".to_s, :count => 2
    assert_select "tr>td", :text => "Target Email".to_s, :count => 2
    assert_select "tr>td", :text => "Thats the simple message".to_s, :count => 2
  end
end
