class Attendance < ActiveRecord::Base
  belongs_to :event, counter_cache: true
  belongs_to :attendee

  validates :event_id, presence: true
  validates :attendee_id, presence: true
  validates_uniqueness_of :event_id, scope: :attendee_id

  class << self
    def find_attendance(event_id, attendee_id)
      Attendance.find_by(event_id: event_id, attendee_id: attendee_id)
    end
  end
end
