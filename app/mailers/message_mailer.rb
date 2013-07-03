class MessageMailer < ActionMailer::Base

	default from: "info@karnykutas.com"

	def notify_recipment(message)
		@message = message
		mail(:to => message.target_email, :subject => "You get KK")
	end

end
