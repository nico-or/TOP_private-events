class Event < ApplicationRecord
  validates_presence_of :name, :description, :location, :date

  belongs_to(
    :host,
    class_name: 'User',
    inverse_of: :hosted_events
  )
end
