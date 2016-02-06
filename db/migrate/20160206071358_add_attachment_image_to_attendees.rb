class AddAttachmentImageToAttendees < ActiveRecord::Migration
  def self.up
    change_table :attendees do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :attendees, :image
  end
end
