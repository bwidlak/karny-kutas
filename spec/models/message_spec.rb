require 'spec_helper'
require 'factory_girl'

describe Message do

 	describe '#on create while you send incomplete message' do

		it 'Name validation should not pass' do
			FactoryGirl.build(:message_without_name).should_not be_valid
		end

		it 'Target name validation should not pass' do
			FactoryGirl.build(:message_without_target_name).should_not be_valid
		end

		it 'Target email validation should not pass' do
			FactoryGirl.build(:message_without_target_email).should_not be_valid
		end

		it 'Body validation should not pass' do
			FactoryGirl.build(:message_without_target_email).should_not be_valid
		end

	end

	it "should have valid factory" do
		FactoryGirl.build(:message).should be_valid
	end
end
