class Caesar
  def initialize(d)
    @d = d
  end

  def encode(character)
    if @d < 0
      offset = @d + 26
    else
      offset = @d
    end
    if character >= 'A'.ord && character <= 'Z'.ord
      encoded_character = character.ord + offset
      if encoded_character > 'Z'.ord
        encoded_character = encoded_character.ord - 26
      end
    else
      encoded_character = character
    end
    return encoded_character
  end

  def decode(character)
    if @d < 0
      offset = @d + 26
    else
      offset = @d
    end
    if character >= 'A'.ord && character <= 'Z'.ord
      decoded_character = character.ord - offset
      if decoded_character < 'A'.ord
        decoded_character = decoded_character.ord + 26
      end
    else
      decoded_character = character
    end
    return decoded_character
  end
end

caesar = Caesar.new(3)

# encode file
byte_array = []
File.open('plain.txt','r') {|file_reader|
  file_reader.each_byte(){|byte| byte_array.push(byte)}
}
encoded_byte_array = []
byte_array.each do |byte|
  encoded_byte_array.push(caesar.encode(byte))
end
File.open('encoded.txt','w') {|file_writer|
  encoded_byte_array.each{|byte|
    print byte.chr
    file_writer << byte.chr}
}
puts

# decode file
byte_array = []
File.open('encoded.txt','r') {|file_reader|
  file_reader.each_byte(){|byte| byte_array.push(byte)}
}
decoded_byte_array = []
byte_array.each do |byte|
  decoded_byte_array.push(caesar.decode(byte))
end
File.open('decoded.txt','w') {|file_writer|
  decoded_byte_array.each{|byte|
    print byte.chr
    file_writer << byte.chr}
}
puts