class User < ActiveRecord::Base
	
	has_many :pledges
	has_many :projects, :through => :pledges

	validates_presence_of :name
	has_secure_password
end
