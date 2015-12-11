class Event < ActiveRecord::Base
  has_many :attendances, dependant: :destroy
  has_many :attendees, through: :attendances

  validates :date, presence: true
  validates :category, presence: true

  CATEGORY =
    [
      ["Service", "service"],
      ["Outreach", "outreach"],
      ["Other", "other"]
    ]
end
