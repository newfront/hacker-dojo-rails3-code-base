#!/usr/bin/ruby -w

# = ChatClient
#
# Purpose is to interact with the Chat server. Creates and forms a message
# to be sent to the Chat server.

require "socket"
require "rubygems"
require "json"
require "ChatUser"

class ChatClient
    
    @@port = 5000
    @@user = {}
    @@sent_messages = 0
    @@socket = nil
    @@user = nil
    
    def initialize(port,user)
       @@port = port if !port.nil?
       @@user = user if user.is_a? ChatUser
       puts "Looks like we are ready to go #{@@user.inspect}"
       @@socket = TCPSocket.new("localhost",@@port)
    end
    
    def send_message(message)
        
        #unless message.is_a? String
            package = format_message(message)
            if package.is_a? Hash
                puts "Sweet. Success. #{package.inspect}"
                # now get ready to send this to the ChatServer
                # Objects can't be sent unless they are first serialized, this
                # means that the Object has been turned into a String
                @@socket.puts package.to_json
            else
               puts "This is not working." 
            end
        #end
        
    end
    
    private
    
    def format_message(message)
        format = Hash.new
        if @@user.is_a? ChatUser
            format["user"] = Hash.new
            format["user"]["name"] = @@user.name
            format["user"]["username"] = @@user.username
            format["user"]["email"] = @@user.email
        end
        format["message"] = Hash.new
        format["message"] = message
       format
    end
    
end

# Generate a new User
chat_user = ChatUser.new("rubyuser","Scott","Haines","scott@newfrontcreative.com")

# Create an instance of ChatClient
chat_client = ChatClient.new(5001,chat_user)

# Send a login request to the Chat Server
chat_client.send_message("login")
