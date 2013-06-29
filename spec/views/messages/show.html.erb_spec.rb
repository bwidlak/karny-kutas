require 'spec_helper'

describe "messages/show" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :name => "Name",
      :target_name => "Target Name",
      :target_email => "Target Email",
      :text => "",
      :ip => "Ip",
      :status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Target Name/)
    rendered.should match(/Target Email/)
    rendered.should match(//)
    rendered.should match(/Ip/)
    rendered.should match(/1/)
  end
end
