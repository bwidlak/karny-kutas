require 'spec_helper'

describe "messages/new" do
  before(:each) do
    assign(:message, stub_model(Message,
      :name => "MyString",
      :target_name => "MyString",
      :target_email => "MyString",
      :text => "",
      :ip => "MyString",
      :status => 1
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", messages_path, "post" do
      assert_select "input#message_name[name=?]", "message[name]"
      assert_select "input#message_target_name[name=?]", "message[target_name]"
      assert_select "input#message_target_email[name=?]", "message[target_email]"
      assert_select "textarea#message_body[name=?]", "message[body]"
    end
  end
end
