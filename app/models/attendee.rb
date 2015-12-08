class Attendee < ActiveRecord::Base
  has_many :attendances

  validates :first_name, presence: true
  validates :contact_no, presence: true
  validates :age, presence: true
  validates :category, presence: true
  validates :group, presence: true

end
