require 'spec_helper'

describe "admin/messages/show" do
  before(:each) do
    @admin_message = assign(:admin_message, stub_model(Message))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
