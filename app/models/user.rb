class User < ActiveRecord::Base
	has_secure_password
	
	has_many :pledges, dependent: :destroy
	has_many :backed_projects, :through => :pledges, source: :project, dependent: :destroy
	has_many :owned_projects, foreign_key: "owner_id", class_name: "Project", dependent: :destroy
	has_many :rewards, :through => :projects, dependent: :destroy #i think this means one 
	#reward per project
	mount_uploader :image, ImageUploader
	validates_presence_of :name, :email, :password
end
