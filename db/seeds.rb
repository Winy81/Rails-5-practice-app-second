# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin user created for me

User.create!(name: "AdamAdmin",
			 email: "adam@adam.com",
			 password: "adamol",
			 password_confirmation: "adamol",
			 admin: true,
			 activated: true,
			 activated_at: Time.zone.now
	 		)

#regular users for test

65.times do |var|
	User.create!(name: "name"+ var.to_s,
		     	 email: "example-#{var.to_s}"+"@barmi.com",
		     	 password: "pass"+var.to_s,
		     	 password_confirmation: "pass"+var.to_s,
		     	 admin: false,
		     	 activated: true,
                 activated_at: Time.zone.now	
		         )
end


users = User.order(:created_at).take(6)

def content_count
	('a'..'z').to_a.shuffle[0,20].join
end

20.times do
  content = content_count
  users.each { |user| user.microposts.create!(content: content) }
end


# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

