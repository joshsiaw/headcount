class AttendeeGroup < ActiveRecord::Base
  has_many :attendees
end
