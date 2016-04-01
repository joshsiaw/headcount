class Attendee < ActiveRecord::Base
  has_many :attendances
  has_many :events, through: :attendances
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "user.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :first_name, presence: true
  validates :contact_no, presence: true
  validates :age, presence: true
  validates :category, presence: true
  validates :group, presence: true

  scope :not_present, -> (event) { where.not(id: event.attendees.pluck(:id)).order('attendees.first_name') }
  scope :group_by, -> (group) { where("group" => group) if group.present? }
  scope :order_by_alphabetical, -> { order('attendees.first_name ASC, attendees.id') }
  scope :visitors, -> (event) { event.attendees.where('category = ? OR category = ?', 'visitor', 'newcomer') }
  scope :first_timers, -> (event) { event.attendees.where('attendances_count <= 1') }

  CATEGORY =
    [
      ["Newcomer", "newcomer"],
      ["Visitor", "visitor"],
      ["Regular", "regular"],
      ["Core", "core"],
      ["Leader", "leader"]
    ]

  GROUP = 
    [
      ["Doulos (12-14 boys)", "Doulos (12-14 boys)"],
      ["Anchor (12-14 boys)", "Anchor (12-14 boys)"],
      ["Forge (15-16)", "Forge (15-16)"],
      ["Hypernicao (17 and above boys)", "Hypernicao (17 and above boys)"],
      ["Forza (12-14 girls)", "Forza (12-14 girls)"],
      ["HIS (12-14 girls)", "HIS (12-14 girls)"],
      ["Courage (15-16 girls)", "Courage (15-16 girls)"],
      ["PPG (15-16 girls)", "PPG (15-16 girls)"],
      ["Pursue (17 and above girls)", "Pursue (17 and above girls)"],
      ["Others", "others"]
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
