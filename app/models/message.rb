class Message < ActiveRecord::Base

	validates_presence_of :name, :target_name, :target_email, :body

end
