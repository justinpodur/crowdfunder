class User < ActiveRecord::Base
	has_secure_password
	
	has_many :pledges
	has_many :backed_projects, :through => :pledges, source: :project
	has_many :owned_projects, foreign_key: "owner_id", class_name: "Project"
	has_many :rewards, :through => :projects #i think this means one 
	#reward per project

	validates_presence_of :name, :email, :password
end
