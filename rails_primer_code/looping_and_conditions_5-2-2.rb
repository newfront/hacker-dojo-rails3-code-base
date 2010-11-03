#!/usr/bin/ruby -w

# = Looping with Conditions

@target = 25

@ages = [10,12,24,35,46,25,19,18,31]

# Loop through the @ages Array

for @i in 0..@ages.length do
  #check to see if the current Array Element is equal to our target
  if @ages[@i] == @target
    puts "Excellent. These conditions have been met"
    break
  else
    puts "Still waiting for my conditions to be met"
  end
end
