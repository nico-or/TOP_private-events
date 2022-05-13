class Event < ApplicationRecord
  validates_presence_of :name, :description, :location, :date

  belongs_to(
    :host,
    class_name: 'User',
    inverse_of: :hosted_events
  )

  has_many :attendances, dependent: :destroy
  has_many(
    :attending_users,
    through: :attendances,
    source: :user
  )

  scope :past, -> { where('date < ?', Date.today) }
  scope :future, -> { where('date >= ?', Date.today) }
end
