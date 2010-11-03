#!/usr/bin/ruby
require "Greeter.rb"

greet = Greeter.new("Scott")
print "#{greet.say_hello}\n"
print "#{greet.say_hello!}"
print greet.inspect
