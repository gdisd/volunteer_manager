class Event < ApplicationRecord
  has_many :events_users
  has_many :users, through: :events_users

  def need_tas?
    num_tas_still_needed > 0
  end

  def num_tas_still_needed
    count = number_of_tas - num_tas
    return 0 unless count > 0
    count
  end

  def num_tas
    users.select { |u| u.is_ta_for?(self)}.length
  end

end
