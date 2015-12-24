class Report < ActiveRecord::Base
  belongs_to :event

  validates :event_id, presence: true
  validates :author, presence: true
  validates :group, presence: true
end
