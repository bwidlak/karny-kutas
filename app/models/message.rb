class Message < ActiveRecord::Base

	validates_presence_of :name, :target_name, :target_email, :body

	validates_length_of :name,        :minimum => 3
	validates_length_of :target_name, :minimum => 3
	validates_length_of :body,        :minimum => 4, :maximum => 140

	validates_format_of :target_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'Wrong email address'


	after_create :send_notification


	def self.search(target_email)
		find(:all, :conditions => {:target_email => target_email})
	end

	private

		def send_notification
			MessageMailer.notify_recipment(self).deliver
		end
		
end
