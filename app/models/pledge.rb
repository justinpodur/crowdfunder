class Pledge < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	has_one :reward, dependent: :destroy

	validates :amount_in_cents, :user_id, :project_id, :presence => true

		def formatted_amount
			amount_in_dollars = amount_in_cents.to_f / 100
			sprintf("%.2f", amount_in_dollars)
		end	
end
