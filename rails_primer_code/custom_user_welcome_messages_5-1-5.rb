#!/usr/bin/ruby -w

#
# = Say Something Different to Different Types of Users
#

class SayHello
  @@username = ''
  @@user_level = 1
  @@message = ''

  def initialize(username,level)
    # take the values, multi-assign them to the class variables
    @@username, @@user_level = username, level
  end

  def greet_me
    message = case
              when @@user_level == 1 then "Welcome #{@@username}, click here to view our tour"
              when @@user_level == 2 then "Welcome Back! #{@@username}"
              when @@user_level == 3 then "Welcome Super-User #{@@username}. We love you"
              else "You are not registered yet, or we screwed up our code"
              end
    puts message
    @@message = message
  end
end

n = SayHello.new("Scott",2)
n.greet_me 
