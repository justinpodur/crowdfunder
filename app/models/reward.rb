class Reward < ActiveRecord::Base
	belongs_to :project

		def formatted_level
			level_in_dollars = level.to_f / 100
			sprintf("%.2f", level_in_dollars)
		end	
end
