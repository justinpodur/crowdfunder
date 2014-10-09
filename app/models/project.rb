class Project < ActiveRecord::Base

	has_many :rewards, dependent: :destroy
	accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true
	has_many :pledges, dependent: :destroy
	has_many :backers, :through => :pledges, source: :user, :foreign_key => "user_id", dependent: :destroy
	belongs_to :owner, class_name: "User"

	validates :description, :name, :deadline, :owner, :goal_in_cents, :presence => true
	validates :goal_in_cents, :numericality => {:only_integer => true}

	mount_uploader :image, ImageUploader

	def formatted_goal
		goal_in_dollars = goal_in_cents.to_f / 100
		sprintf("%.2f", goal_in_dollars)
	end


	def self.search(search)

		if search
			@projects = Project.where('lower(name) = ?', search.downcase)
		else 
			@projects = Project.all
		end 
	end

end
