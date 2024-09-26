# One-Time Pad
    
require "readline"

puts "Enter message to be encrypted below:"
message = Readline.readline("> ", true).chars

puts
puts "The message length is " + message.length.to_s + " characters."

key = ""

puts
puts "Enter random key with a length of " + message.length.to_s + " characters below:"
key = Readline.readline("> ", true).chars

puts
while key.length > message.length or message.length < 12
    puts "Key length is greater than or less than message length."
    
    puts
    puts "Enter key with a length of " + message.length.to_s + " characters below:"
    key = Readline.readline("> ", true).chars
end

ciphertext = ""

for index in 0..message.length do
    #
end
