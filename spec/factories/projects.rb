require 'faker'

FactoryGirl.define do
	factory :project do
		description {Faker::Lorem.sentence}
		name "This is a name"
		goal_in_cents 5000
		owner_id 1
	end
end