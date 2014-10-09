require "rails_helper"

describe Project do 


		# validation tests

		it 'is invalid without a name' do
			expect(build(:project, name: nil)).to_not be_valid
		end

		it 'is invalid without an description' do
			expect(build(:project, description: nil)).to_not be_valid
		end


		it 'is invalid without a owner id' do
			expect(build(:project, owner_id: nil)).to_not be_valid
		end

		it 'is invalid if goal in cents is not an integer' do
			expect(build(:project, goal_in_cents: "")).to_not be_valid
		end

		it 'is invalid without a goal in cents' do
			expect(build(:project, goal_in_cents: nil)).to_not be_valid
		end
	
	# association tests

	it "should belong to an owner" do 
		expect(build(:project)).to respond_to(:owner)
	end

	it "should have many backers" do 
		expect(build(:project)).to respond_to(:backers)
	end

	it "should have many rewards" do 
		expect(build(:project)).to respond_to(:rewards)
	end

	it "should have many pledges" do 
		expect(build(:project)).to respond_to(:pledges)
	end

end