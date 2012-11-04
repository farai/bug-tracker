# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'
require 'date'

bug_status = ['Open', 'Resolved']
priority = ['Low', 'Medium', 'High']

def date_rand(from = 0.0, to = Time.now)
  Time.at(from + rand * (to.to_f - from.to_f)).to_date
end

#user data
puts "Creating User Seed Data"

u = User.new(:email => 'tester@test.com', :password => 'password', :password_confirmation => 'password')
u.save

u1 = User.new(:email => Faker::Internet.email, :password => 'password', :password_confirmation => 'password')
u1.save

u2 = User.new(:email => Faker::Internet.email, :password => 'password', :password_confirmation => 'password')
u2.save

u3 = User.new(:email => Faker::Internet.email, :password => 'password', :password_confirmation => 'password')
u3.save

#load user so we can use ids elsewhere
user = User.find_by_email(u.email)
user1 = User.find_by_email(u1.email)
user2 = User.find_by_email(u2.email)
user3 = User.find_by_email(u3.email)


#project data
puts "Creating Project Seed Data"

p1 = Project.new(:name => 'Project1' , :owner => Faker::Company.name, :release_date=> date_rand(1.0) )
p1.save

p2 = Project.new(:name => 'Project2' , :owner => Faker::Company.name, :release_date=> date_rand(1.0) )
p2.save

p3 = Project.new(:name => 'Project3' , :owner => Faker::Company.name, :release_date=> date_rand(1.0) )
p3.save

p4 = Project.new(:name => 'Project4', :owner => Faker::Company.name, :release_date=> date_rand(1.0) )
p4.save

p5 = Project.new(:name => 'Project5' , :owner => Faker::Company.name, :release_date=> date_rand(1.0) )
p5.save

#load project so we can use project id elsewehere
proj1 = Project.find_by_name(p1.name)
proj2 = Project.find_by_name(p2.name)
proj3 = Project.find_by_name(p3.name)
proj4 = Project.find_by_name(p4.name)
proj5 = Project.find_by_name(p5.name)

#bug data
puts "Creating Bug Seed Data"
b1 = Bug.new(:project_id => proj1.id, :author => Faker::Name.name , :email => Faker::Internet.email ,:short_desc => Faker::Lorem.sentence(word_count=10), :description => Faker::Lorem.paragraphs, :priority => priority[rand(priority.size)], :status => bug_status[rand(bug_status.size)])
b1.save

b2 = Bug.new(:project_id => proj2.id, :author => Faker::Name.name , :email => Faker::Internet.email ,:short_desc => Faker::Lorem.sentence(word_count=10), :description => Faker::Lorem.paragraphs, :priority => priority[rand(priority.size)], :status => bug_status[rand(bug_status.size)])
b2.save

b3 = Bug.new(:project_id => proj3.id, :author => Faker::Name.name , :email => Faker::Internet.email ,:short_desc => Faker::Lorem.sentence(word_count=10), :description => Faker::Lorem.paragraphs, :priority => priority[rand(priority.size)], :status => bug_status[rand(bug_status.size)])
b3.save

bug1 = Bug.find_by_project_id(b1.project_id)
bug2 = Bug.find_by_project_id(b2.project_id)
bug3 = Bug.find_by_project_id(b3.project_id)


#comments
# puts "Creating Comments Seed Data"
# 
# c = Comment.new(:user_id => user.id, :bug_id => bug1.id, :body => Faker::Lorem.sentence(word_count=10))
# c.save
# 
# c1 = Comment.new(:user_id => user1.id, :bug_id => bug2.id, :body => Faker::Lorem.sentence(word_count=10))
# c1.save
# 
# c2 = Comment.new(:user_id => user2.id, :bug_id => bug3.id, :body => Faker::Lorem.sentence(word_count=10))
# c2.save





