# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create(:username => "scotthaines", :password => "scott123", :email => "scott@newfrontcreative.com")
User.create(:username => "matt", :password => "matt123", :email => "matt@gmail.com")
User.create(:username => "doug", :password => "doug123", :email => "doug@gmail.com")
User.create(:username => "shanghigh_steve", :password => "doingitwell", :email => "doug@gmail.com")

UserStatus.create(:status_update => "Here is a twit by me...",:user_id => 1)
UserStatus.create(:status_update => "Here is a twit by me as well...",:user_id => 2)
UserStatus.create(:status_update => "It is a bit cold outside...",:user_id => 2)