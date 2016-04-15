class AddKpiToEvents < ActiveRecord::Migration
  def change
    add_column :events, :prayer_count_1, :integer
    add_column :events, :prayer_count_2, :integer
    add_column :events, :head_count_1, :integer
    add_column :events, :head_count_2, :integer
  end
end
