class Project < ActiveRecord::Base
	validates :description, :name, :deadline, :presence => true
	validates :goal_in_cents, :numericality => {:only_integer => true}
end
