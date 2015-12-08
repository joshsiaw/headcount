class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_no
      t.string :email
      t.integer :age
      t.string :photo_url
      t.string :category
      t.string :group
      t.timestamps null: false
    end
  end
end
