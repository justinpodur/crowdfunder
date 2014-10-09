require 'faker'

FactoryGirl.define do
	factory :projects do
		email {Faker::Internet.email}
		name {Faker::Name.name}
		password 'bobisbob'
	end
end