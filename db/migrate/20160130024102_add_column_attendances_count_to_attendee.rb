class AddColumnAttendancesCountToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :attendances_count, :integer, :default => 0
  end
end
