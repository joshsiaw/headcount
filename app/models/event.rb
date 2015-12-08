class Event < ActiveRecord::Base
  has_many :attendances

  validates :date, presence: true
  validates :category, presence: true
end
