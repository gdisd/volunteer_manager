# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# create a default admin user
users = [
  {
    email: 'nainanalluri@gmail.com',
    password: 'adminadmin'
  },
  {
    email: 'ltrammer@gmail.com',
    password: 'adminadmin'
  },
  {
    email: 'courtney@girldevelopit.com',
    password: 'adminadmin'
  },
  {
    email: 'shana@girldevelopit.com',
    password: 'adminadmin'
  }
]

users.each do |attrs|
  user = User.where(:email => attrs[:email]).first_or_create(:password => attrs[:password], :password_confirmation => attrs[:password])
  user.add_role :admin
  user.save!
end
