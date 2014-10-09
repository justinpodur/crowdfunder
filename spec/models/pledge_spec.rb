require "rails_helper"

describe Pledge do 


		# validation tests

	it 'is invalid without a project id ' do
		expect(build(:pledge, project_id: nil)).to_not be_valid
	end
	it 'is invalid without a user id ' do
		expect(build(:pledge, user_id: nil)).to_not be_valid
	end
	it 'is invalid without an amount' do
		expect(build(:pledge, amount_in_cents: nil)).to_not be_valid
	end

	it 'is invalid if amount is not an integer' do
		expect(build(:pledge, amount_in_cents: "")).to_not be_valid
	end
	
	# association tests

	it "should belong to a user" do 
		expect(build(:pledge)).to respond_to(:user)
	end

	it "should have one reward" do 
		expect(build(:pledge)).to respond_to(:reward)
	end

	it "should belong to a project" do 
		expect(build(:pledge)).to respond_to(:project)
	end


end