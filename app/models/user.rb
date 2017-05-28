class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events_users
  has_many :events, through: :events_users

  #SCHEDULE
  def history
    self.events.select { |e| e.date < Date.tomorrow }.sort_by { |e| e.date }
  end

  def schedule
    self.events.select { |e| e.date > Date.yesterday }.sort_by { |e| e.date }
  end

  def is_ta_for?(event)
    self.events_users.where(event: event).present?
  end

  #STATUSES
  def set_pending
    self.update_attribute(:status, 'pending')
  end
end
