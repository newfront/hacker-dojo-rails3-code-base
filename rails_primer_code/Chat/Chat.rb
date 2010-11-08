#!/usr/bin/ruby -w

# = Chat
# This is a simple Class to demonstrate the power of Ruby.
#
# This class requires socket

require "socket"
require "rubygems"
require "hashie"
require "json"
# require "chat_channel"

class Chat
    $allowed_users = ["scott","rubyuser","daemonkid"] #this is global
    @@channels = {} #open channels Hash
    @@users = {} #current users Hash
    @@port = 5000 #port to bind the server to
    
    # Create a new Chat Object
    def initialize(port = nil)
        @@port = port if !port.nil?
        puts "Port is equal to #{@@port.to_s}"
    end
    
    # Bind Chat Server to class variable @@port
    def create_chat_server
        @@server = TCPServer.open(@@port)
        puts "Chat Server up and running on port #{@@port}"
        
        # Start a Loop to listen to incoming messages
        loop {
            Thread.start(@@server.accept) do |user|
                puts "User info: #{user.inspect}"
                # self is Chat Object even though we are in a new Thread
                #puts "Who am i? #{self.inspect}"
                
                #info = user.peeraddr
                #ip = info[3].gsub(/[::A-Za-z]/,'')
                
                message = user.gets.chop!
                json_message = JSON.parse(message)
                current_user = json_message["user"] if !json_message["user"].nil?
                puts "Message is now #{json_message.inspect}"
                #user.close
                
                if !json_message["message"].nil?
                    # At this point we know we are working with messages
                    # and Objects and also that we have a message to work with
                else
                    # otherwise, fail closed and kill this socket connection
                    user.close 
                end
                
                self.respond_to_message(json_message["message"],current_user)
                
            end
        }
    end
    
    # Respond to Message
    def respond_to_message(message, user)
       puts "Got a message of '#{message}' from the User #{user.inspect}" 
       
       case message
       when "login"
           puts "User wishes to login"
           break
           
       end
       # use the case Condition to respond to different requests
       # login
       # logout
       # create_channel
       # kill_channel
       # send_message_to_channel
       # send_message_to_user
       
    end
    
end

#c = Chat.new()
c = Chat.new(5001)
c.create_chat_server