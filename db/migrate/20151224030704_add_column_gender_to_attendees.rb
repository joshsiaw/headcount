class AddColumnGenderToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :gender, :string
    add_column :attendees, :remark, :string
  end
end
