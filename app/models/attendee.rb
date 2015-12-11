class Attendee < ActiveRecord::Base
  has_many :attendances
  has_many :events, through: :attendances

  validates :first_name, presence: true
  validates :contact_no, presence: true
  validates :age, presence: true
  validates :category, presence: true
  validates :group, presence: true

  scope :not_present, -> (event) { where.not(id: event.attendees.pluck(:id)) }

  CATEGORY =
    [
      ["Newcomer", "newcomer"],
      ["Regular", "regular"],
      ["Core", "core"],
      ["Leader", "leader"]
    ]

  GROUP =
    [
      ["Forge", "forge"],
      ["Central", "central"],
      ["Ezer", "ezer"],
      ["Neuvo", "neuvo"]
    ]

  def name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name.try(:[], 0)}#{last_name.try(:[], 0)}"
  end
end
