class Event < ActiveRecord::Base
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances
  has_many :reports, dependent: :destroy

  validates :date, presence: true
  validates :category, presence: true

  scope :order_by_created_at, -> { order('events.created_at DESC, events.id') }

  CATEGORY =
    [
      ["Service", "service"],
      ["Outreach", "outreach"],
      ["Other", "other"]
    ]
end
