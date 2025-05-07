# One-Time Pad

require "readline"

loop do
    puts "Enter message to be encrypted below:"
    message = Readline.readline("➤ ", true).chars
    
    puts
    
    encoding_chart = Hash.new
    index = 1
    
    for char in message do
        if encoding_chart[char] == nil
            if index < 10
                encoding_chart[char] = '0' + index.to_s
            else
                encoding_chart[char] = index.to_s
            end
            index += 1
        end
    end
    
    encoded_message = ''
    
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
    
    key = ''
    
    loop do
        puts
        puts "Enter random " + encoded_message.length.to_s + " digit numeric key below:"
        key = Readline.readline("➤ ", true).chars
        
        while key.length != encoded_message.length
            puts
            puts "Key entered is not " + encoded_message.length.to_s + " digits in length."
            
            puts
            puts "Enter random " + encoded_message.length.to_s + " digit numeric key below:"
            key = Readline.readline("➤ ", true).chars
        end
        
        key = key.join
        
        key = Integer(key) rescue nil
        
        if key == nil
            puts "Key entered is not numeric."
        else
            key = key.to_s
            break
        end
    end
    
    enciphered_message = encoded_message.to_i ^ key.to_i
    
    puts
    puts "Enciphered message:"
    index = 0
    
    for char in enciphered_message.to_s.chars do
        print char
        index += 1
        if index == 5
            print ' '
            index = 0
        end
    end
    
    deciphered_message = enciphered_message.to_i ^ key.to_i
    
    for i in deciphered_message.to_s.length..(enciphered_message.to_s.length - 1) do
        deciphered_message = "0" + deciphered_message.to_s
    end
    
    puts
    puts
    puts "Deciphered message:"
    index = 0
    
    for char in deciphered_message.to_s.chars do
        print char
        index += 1
        if index == 5
            print ' '
            index = 0
        end
    end
    
    decoded_message = ''
    
    index = 0
    encoding_chart.invert
    
    while index < (deciphered_message.to_s.length - 1) do
        value = deciphered_message.to_s.chars[index] + deciphered_message.to_s.chars[index + 1]
        if encoding_chart.key(value) != nil
            decoded_message += encoding_chart.key(value)
        end
        index += 2
    end
    
    puts
    puts
    puts "Decoded message:"
    puts decoded_message
    puts
end
