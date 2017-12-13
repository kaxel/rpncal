#!/usr/bin/ruby
$LOAD_PATH << './lib'
require "calc"

puts "welcome to the RPN calculator."
puts "enter your values after the prompt."
puts "press q to exit."
@calc = Calc.new
while a = gets
  if a.delete("\n").upcase=="Q"
    puts "exiting"
    exit
  else
    puts "->: #{@calc.take(a)}"
    
  end
end
puts "thank you for using the RPN calculator."

