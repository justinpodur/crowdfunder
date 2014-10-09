require 'faker'

FactoryGirl.define do
	factory :reward do
		description {Faker::Lorem.sentence}
		name {Faker::Name.name}
		pledge_id 1
		level 1
	end
end