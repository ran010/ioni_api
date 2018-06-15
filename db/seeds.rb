# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:"admin@test.com", isAdmin:true, password:"aaaaaa", password_confirmation:"aaaaaa", address:"Gwarko")

User.create(email:"abc@test.com", isAdmin:false, password:"aaaaaa", password_confirmation:"aaaaaa", address:"patan",batch:"072",semester:"5th")
User.create(email:"abc@test.com", isAdmin:false, password:"aaaaaa", password_confirmation:"aaaaaa", address:"kathmandu",batch:"071",semester:"7th")
