class AddDeadlineColumnToProject < ActiveRecord::Migration
  def change
  	add_column :projects, :deadline, :datetime
  end
end
