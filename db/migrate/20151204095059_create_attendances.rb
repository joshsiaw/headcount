class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :event, index: true, foreign_key: true
      t.references :attendee, index: true, foreign_key: true
      t.string :remark
      t.timestamps null: false
    end
  end
end
