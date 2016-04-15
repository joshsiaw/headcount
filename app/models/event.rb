class Event < ActiveRecord::Base
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances
  has_many :reports, dependent: :destroy

  validates :date, presence: true
  validates :category, presence: true
  validates :prayer_count_1, numericality: { only_integer: true }
  validates :prayer_count_2, numericality: { only_integer: true }
  validates :head_count_1, numericality: { only_integer: true }
  validates :head_count_2, numericality: { only_integer: true }

  scope :order_by_created_at, -> { order('events.created_at DESC, events.id') }

  CATEGORY =
    [
      ["Service", "service"],
      ["Outreach", "outreach"],
      ["Other", "other"]
    ]
end
