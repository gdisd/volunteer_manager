class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:meetup]
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

  def set_approved
    self.update_attribute(:status, 'approved')
  end

  #Omniauth meetup

  def self.new_with_session(params, session)
    # call super(the overwritten function), it will return a resource and in this case you are
    # naming it 'user' in the block
    super.tap do |user|
      # if extra information was provided by facebook when user logged in, assign whatever comes in
      # session["devise.facebook_data"]["extra"]["raw_info"] to 'data' variable
      if data = session["devise.meetup_data"] && session["devise.meetup_data"]["extra"]["raw_info"]
        # assign 'email' given by facebook in case the 'user' object doesn't have one yet
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
