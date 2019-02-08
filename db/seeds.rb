# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
65.times do |var|
	User.create!(name: "name"+ var.to_s,
		     	 email: "example-#{var.to_s}"+"@barmi.com",
		     	 password: "pass"+var.to_s,
		     	 password_confirmation: "pass"+var.to_s,
		     	 admin: true	
		         )
end