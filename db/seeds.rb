# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin user created for me

User.create!(name: AdamAdmin
			 email: adam@adam.com
			 password: "pass"
			 password_confirmation: "pass"
			 admin: true
			 activated: true
			 activated_at: Time.zone.now
	 		)

#regular users for test

65.times do |var|
	User.create!(name: "name"+ var.to_s,
		     	 email: "example-#{var.to_s}"+"@barmi.com",
		     	 password: "pass"+var.to_s,
		     	 password_confirmation: "pass"+var.to_s,
		     	 admin: false
		     	 activated: true,
                 activated_at: Time.zone.now	
		         )
end