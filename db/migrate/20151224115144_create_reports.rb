class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :event, index: true, foreign_key: true
      t.string :author
      t.string :group
      t.string :remark
      t.timestamps null: false
    end
  end
end
