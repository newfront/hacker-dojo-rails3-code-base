#!/usr/bin/ruby -w

# = Simple User Class
require "rubygems"
require "hashie"

class ChatUser
    
    @@user = Hashie::Mash.new
    
    def initialize(username , first_name , last_name , email)
        @@user = Hashie::Mash.new if !@@user.is_a? Hashie::Mash
        @@user.username = username.to_s
        @@user.name = first_name +" "+ last_name
        @@user.email = email.to_s
        puts "User generated #{@@user.inspect}"
    end
    
    def say_name
        puts "My name is #{@@user.name}" if @@user.is_a? Hashie::Mash
    end
    
    def name
       return @@user.name
    end
    
    def username
       return @@user.username 
    end
    
    def email
       return @@user.email 
    end
    
end