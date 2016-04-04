class CreateAttendeeCategories < ActiveRecord::Migration
  def change
    create_table :attendee_categories do |t|
      t.string :name
      t.string :description
      t.timestamps null: false
    end

    add_column :attendees, :attendee_category_id, :integer
    add_index :attendees, :attendee_category_id
    add_foreign_key :attendees, :attendee_categories
  end
end
