class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many(
    :hosted_events,
    class_name: 'Event',
    inverse_of: :host,
    foreign_key: :host_id
  )

  has_many :attendances
  has_many(
    :attending_events,
    through: :attendances,
    source: :event
  )

  def attends? event
    event.attending_users.include? self
  end
end
