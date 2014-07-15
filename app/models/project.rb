class Project < ActiveRecord::Base
	validates :description, :name, :deadline, :presence => true
	validates :goal_in_cents, :numericality => {:only_integer => true}

	def formatted_goal
		goal_in_dollars = goal_in_cents.to_f / 100
		sprintf("%.2f", goal_in_dollars)
	end	
end
