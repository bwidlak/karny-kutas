require "spec_helper"
require "factory_girl"

describe MessageMailer do

	it 'creates and sends an email' do
		message = FactoryGirl.create(:message)
		notify_recipient = MessageMailer.notify_recipment(message).deliver
		notify_recipient.to.should == ["jenna@factorygirl.co.uk"]
		notify_recipient.subject.should=="You get KK"
		notify_recipient.body.encoded.should match "http://localhost:3000/messages/#{message.id}"
	end

end
