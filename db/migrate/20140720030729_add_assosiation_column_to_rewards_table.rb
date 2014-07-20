class AddAssosiationColumnToRewardsTable < ActiveRecord::Migration
  def change
  	add_column :rewards, :pledge_id, :integer
  end
end
