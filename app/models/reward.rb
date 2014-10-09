class Reward < ActiveRecord::Base
	belongs_to :project
	belongs_to :pledge

	validates_presence_of :name, :level, :description, :pledge_id

		def formatted_level
			level_in_dollars = level.to_f / 100
			sprintf("%.2f", level_in_dollars)
		end	
end
