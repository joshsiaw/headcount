class AttendeeCategory < ActiveRecord::Base
  has_many :attendees
end
