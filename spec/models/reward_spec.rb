require "rails_helper"

describe Reward do 

	context "Before creation" do
		it "has a valid factory" do 
			reward_one = build(:reward)
			expect(reward_one).to be_valid
		end 
		# validation tests
		# name tests

		it 'is invalid without a name' do
			expect(build(:reward, name: nil)).to_not be_valid
		end

		# email tests

		it 'is invalid without an level' do
			expect(build(:reward, level: nil)).to_not be_valid
		end

		# password tests
		it 'is invalid without a description' do
			expect(build(:reward, description: nil)).to_not be_valid
		end

		it 'is invalid without a pledge id' do
			expect(build(:reward, pledge_id: nil)).to_not be_valid
		end
	
	end

	# association tests

	it "should belong to a project" do 
		expect(build(:reward)).to respond_to(:project)
	end

	it "should belong to a pledge" do 
		expect(build(:reward)).to respond_to(:pledge)
	end



end