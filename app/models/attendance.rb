class Attendance < ActiveRecord::Base
  belongs_to :event, counter_cache: true
  belongs_to :attendee

  validates :event_id, presence: true
  validates :attendee_id, presence: true
end
