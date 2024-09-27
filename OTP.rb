# One-Time Pad
    
require "readline"

puts "Enter message to be encrypted below:"
message = Readline.readline("> ", true).chars

puts
# puts "The message length is " + message.length.to_s + " characters."

encoding_chart = Hash.new
index = 0

for char in message do
    if encoding_chart[char] == nil
        if index < 10
            encoding_chart[char] = "00" + index.to_s
        elsif index < 100
            encoding_chart[char] = "0" + index.to_s
        else
            encoding_chart[char] = index.to_s
        end
        index += 1
    end
end

encoded_message = ""

for char in message do
    encoded_message += encoding_chart[char]
end

remainder = encoded_message.length % 5
difference = 5 - remainder

while difference > 0
    encoded_message += '0'
    difference -= 1
end

puts "Encoded message:"

index = 0

for char in encoded_message.chars do
    print char
    index += 1
    if index == 5
        print ' '
        index = 0
    end
end

puts

key = ""

loop do
    puts
    puts "Enter random numeric key with a length of " + encoded_message.length.to_s + " digits below:"
    key = Readline.readline("> ", true).chars

    while key.length != encoded_message.length
        puts
        puts "Key entered is not " + encoded_message.length.to_s + " digits in length."
        
        puts
        puts "Enter random numeric key with a length of " + encoded_message.length.to_s + " digits below:"
        key = Readline.readline("> ", true).chars
    end

    key = key.join
    
    key = Integer(key) rescue nil

    if key == nil
        puts "Key entered is not numeric."
    else
        break
    end
end
