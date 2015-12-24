class Attendee < ActiveRecord::Base
  has_many :attendances
  has_many :events, through: :attendances

  validates :first_name, presence: true
  validates :contact_no, presence: true
  validates :age, presence: true
  validates :category, presence: true
  validates :group, presence: true

  scope :not_present, -> (event) { where.not(id: event.attendees.pluck(:id)).order('attendees.first_name') }
  scope :group_by, -> (group) { where("event.attendees.group" => group)}

  CATEGORY =
    [
      ["Newcomer", "newcomer"],
      ["Regular", "regular"],
      ["Core", "core"],
      ["Leader", "leader"]
    ]

  GROUP =
    [
      ["12-14 (Dave)", "12-14 (Dave)"],
      ["15-16 (Hao Jie)", "15-16 (Hao Jie)"],
      ["15-16 (Nick)", "15-16 (Nick)"],
      ["17 and above (Alvin)", "17 and above (Alvin)"],
      ["12-14 (Chri)", "12-14 (Chri)"],
      ["12-14 (Ruth)", "12-14 (Ruth)"],
      ["15-16 (Yen Mii)", "15-16 (Yen Mii)"],
      ["17 and above (Jas)", "17 and above (Jas)"],
      ["17 and above (Eleni)", "17 and above (Eleni)"]
    ]

    GENDER = 
    [
      ["Male", "male"],
      ["Female", "female"]
    ]

  def name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name.try(:[], 0)}#{last_name.try(:[], 0)}"
  end
end
