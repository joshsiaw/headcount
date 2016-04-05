class Attendee < ActiveRecord::Base
  has_many :attendances
  has_many :events, through: :attendances
  belongs_to :attendee_category
  belongs_to :attendee_group
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "user.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :first_name, presence: true
  validates :contact_no, presence: true
  validates :age, presence: true

  scope :not_present, -> (event) { where.not(id: event.attendees.pluck(:id)).order('attendees.first_name') }
  scope :present, -> (event) { where(id: event.attendees.pluck(:id)).order('attendees.first_name') }
  scope :group_by, -> (group) { where("attendee_group_id" => group) if group.present? }
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
      ["Doulos (12-14 boys)", "12-14 (Dave)"],
      ["Anchor (12-14 boys)", "15-16 (Hao Jie)"],
      ["Forge (15-16 boys)", "15-16 (Nick)"],
      ["Hypernicao (17 and above boys)", "17 and above (Alvin)"],
      ["Forza (12-14 girls)", "12-14 (Chri)"],
      ["HIS (12-14 girls)", "12-14 (Ruth)"],
      ["Courage (15-16 girls)", "15-16 (Yen Mii)"],
      ["PPG (15-16 girls)", "17 and above (Jas)"],
      ["Pursue (17 and above girls)", "17 and above (Eleni)"],
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
