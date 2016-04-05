class AttendeeGroup < ActiveRecord::Base
  has_many :attendees
  has_many :reports
end
