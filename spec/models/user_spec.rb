require "rails_helper"


describe User do 

	context "Before creation" do
		it "has a valid factory" do 
			user_one = build(:user)
			expect(user_one).to be_valid
		end 
		# validation tests
		# name tests

		it 'is invalid without a name' do
			expect(build(:user, name: nil)).to_not be_valid
		end

		# email tests

		it 'is invalid without an email' do
			expect(build(:user, email: nil)).to_not be_valid
		end

		# password tests
		it 'is invalid without a password' do
			expect(build(:user, password: nil)).to_not be_valid
		end
	
	end

	# association tests

	it "should have many pledges" do 
		expect(build(:user)).to respond_to(:pledges)
	end

	it "should have many backed projects" do 
		expect(build(:user)).to respond_to(:backed_projects)
	end


	it "should have many owned projects" do 
		expect(build(:user)).to respond_to(:owned_projects)
	end

	it "should have many rewards" do 
		expect(build(:user)).to respond_to(:rewards)
	end




end