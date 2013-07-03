FactoryGirl.define do
	factory :message do
		name 'Honest John'
		target_name 'Lovely Jenna'
		target_email 'jenna@factorygirl.co.uk'
		body 'I love you Jenna!'
	end

	factory :message_without_name, :class => Message do
		name ''
		target_name 'Lovely Jenna'
		target_email 'jenna@factorygirl.co.uk'
		body 'I love you Jenna!'
	end

	factory :message_without_target_name, :class => Message do
		name 'John'
		target_name ''
		target_email 'jenna@factorygirl.co.uk'
		body 'I love you Jenna!'
	end

	factory :message_without_target_email, :class => Message do
		name 'John'
		target_name 'Lovely Jenna'
		target_email ''
		body 'I love you Jenna!'
	end

	factory :message_without_body, :class => Message do
		name 'John'
		target_name 'Lovely Jenna'
		target_email 'jenna@factorygirl.co.uk'
		body ''
	end

end