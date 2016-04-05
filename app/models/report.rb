class Report < ActiveRecord::Base
  belongs_to :event
  belongs_to :attendee_group

  validates :event_id, presence: true
  validates :attendee_group_id, presence: true
  validates :author, presence: true
  validates :group, presence: true
end
