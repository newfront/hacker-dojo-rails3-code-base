#!/usr/bin/ruby

#
# = Greeter Class
#
# == Abstract
#This is a quick a dirty example of building a class in Ruby. We will create a
#Greeter class, you build the object by giving it a name, and it greets that name.
#
#<b>Use Cases</b>
#Instantiate New Object and append a name, invoke the say_hello method
# * greet = Greeter.new("Scott")
# * greet.say_hello
#

class Greeter
  
  # declare @@name as an empty string
  @@name = ''

  def initialize(str)
    @@name = str.to_s
  end

  def say_hello
      #returns nil
    puts "Hello, #{@@name}" 
  end

  def say_hello!
    puts "Hello, Sir #{@@name}. I understand it is urgent."
  end

end 
