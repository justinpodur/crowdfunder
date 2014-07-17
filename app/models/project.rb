class Project < ActiveRecord::Base

	has_many :rewards
	accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true
	has_many :pledges
	has_many :users, :through => :pledges

	validates :description, :name, :deadline, :presence => true
	validates :goal_in_cents, :numericality => {:only_integer => true}

	mount_uploader :image, ImageUploader

	def formatted_goal
		goal_in_dollars = goal_in_cents.to_f / 100
		sprintf("%.2f", goal_in_dollars)
	end	
end
