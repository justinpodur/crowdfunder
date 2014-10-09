require 'faker'

FactoryGirl.define do
	factory :pledge do
		project_id 1
		user_id 1
		amount_in_cents 5000
	end
end