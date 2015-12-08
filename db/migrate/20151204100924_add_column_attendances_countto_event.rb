class AddColumnAttendancesCounttoEvent < ActiveRecord::Migration
  def change
    add_column :events, :attendances_count, :integer, :default => 0
  end
end
