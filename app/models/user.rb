class User < ActiveRecord::Base
	
	has_many :pledges
	has_many :projects, :through => :pledges
	has_many :rewards, :through => :projects #i think this means one 
	#reward per project

	validates_presence_of :name
	has_secure_password
end
