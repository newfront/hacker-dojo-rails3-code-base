#!/usr/bin/ruby -w

# = Membership System
# Check to see if a Membership is expired
require 'rubygems' #note. Ruby 1.9 includes rubygems by default, so this is not nessesary
require 'hashie'

# parsedate will take a String and return a Time object
require 'parsedate'
include ParseDate

class Membership
    
    # Setup your variable references
    # note. Ruby is dynamic, but your whole Class won't know that unless you add some special touches.
    @@user = {}
    @@expiration_period = 30
    
    # automatic method, use to setup Class configs
    def initialize(user, expires)
        @@user = user if user.is_a? Hashie::Mash
        @@expiration_period = expires if expires.is_a? Integer
    end
    
    def am_i_good?(user = nil)
        @@user = user if !user.nil?
        time = Time.now
        last_real_payment = @@user.membership.payment_date
        
        # Convert the Users last payment to a Time object from String
        last_payment_as_time = Time.local(*parsedate(last_real_payment))
        
        #parse the date string and compare the current Time against the last payment made by the User
        
        # if the users payment datetime plus the (subscription period) is greater than or equal to the current datetime
        #puts "paid date = #{(Time.local("parsedate(last_real_payment)").to_i + @@expiration_period*60*60*24).to_s} >= #{(time.to_i).to_s}"
        if ((last_payment_as_time.to_i + @@expiration_period*60*60*24) >= time.to_i)
            puts "Welcome In"
        else
           puts "Payup Deadbeat" 
        end
    end
    
    def get_user
        return @@user if @@user.defined?
    end
    
    def get_subscription_expiration_period
       return @@expiration_period if !@@expiration_period.nil?
    end
    
    def just_tell_me_something
        puts "Membership Class has defined this method"
    end
    
    
end

class LetMeIn < Membership
    
    @@parent = nil
    
    def initialize(parent)
        @@parent = parent
        #puts "Luckily Membership has already defined #{@@expiration_period.to_s}"
    end
    
    def get_user_subscription_info
        puts @@parent.get_user.inspect
    end
    
    def super_class_subscription_period
        puts "Membership Class has an expiration period of %d" % @@parent.get_subscription_expiration_period
    end
    
end

# Flow
# Create a User, this would typically come from a database
# or alternative dynamic repository

user = Hashie::Mash.new
user.name = "Scott Haines"
user.membership = Hashie::Mash.new

# Get a Welcome in, if (user.membership.payment_date + subscription period) >= current date
# Modify the date below to be the current date of this test
user.membership.payment_date = "Fri Nov 05 21:06:22 -0700 2010"
# Get a Payup Notice with this old date
#user.membership.payment_date = "Fri May 05 21:06:22 -0700 2010"

# Create a new Membership Object
member = Membership.new(user,60)
member.am_i_good?

# Reference a Class from within another Class
super_test = LetMeIn.new(member)
#puts super_test.get_user.inspect

# Call the super class function from within the sub-class
#super_test.get_user_subscription_info

# Get the reference to Membership's expiration period info
super_test.super_class_subscription_period

# Inheiritance from Membership to LetMeIn
super_test.just_tell_me_something