class CreateAttendeeGroups < ActiveRecord::Migration
  def change
    create_table :attendee_groups do |t|
      t.string :name
      t.string :description
      t.timestamps null: false
    end

    add_column :attendees, :attendee_group_id, :integer
    add_index :attendees, :attendee_group_id
    add_foreign_key :attendees, :attendee_groups
  end
end
