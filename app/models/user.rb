class User < ActiveRecord::Base
	
	has_many :pledges
	has_many :projects, :through => :pledges
	has_secure_password
end
