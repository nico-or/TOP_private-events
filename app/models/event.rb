class Event < ApplicationRecord
  validates_presence_of :name, :description, :location, :date

  belongs_to(
    :host,
    class_name: 'User',
    inverse_of: :hosted_events
  )

  has_many :attendances
  has_many(
    :attending_users,
    through: :attendances,
    source: :user
  )
end
