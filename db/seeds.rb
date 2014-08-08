# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'admin@admin.pl',password: 'admin1234' , name: 'Administrator', nickname: 'admin', admin: true)
User.create(email: 'user@user.pl',password: 'user1234' , name: 'User', nickname: 'user', admin: false)