class AddAttendeeGroupIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :attendee_group_id, :integer
    add_index :reports, :attendee_group_id
    add_foreign_key :reports, :attendee_groups
  end
end
