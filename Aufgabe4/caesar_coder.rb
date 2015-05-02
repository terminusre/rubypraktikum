class Caesar
  def initialize(d = -25)
    @d = d
  end

  def encode(character)
    if @d < 0
      offset = @d + 26
    else
      offset = @d
    end
    if character >= 'A' && character <= 'Z'
      encoded_character = (character.ord + offset).chr
      if encoded_character > 'Z'
        encoded_character = (encoded_character[i].ord - 26).chr
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
    if character >= 'A' && character <= 'Z'
      decoded_character = (character.ord - offset).chr
      if decoded_character < 'A'
        decoded_character = (decoded_character[i].ord + 26).chr
      end
    else
      decoded_character = character
    end
    return decoded_character
  end
end

#c = Caesar.new
#s = 'HALLOZ'
#puts c.encode(s)
#puts s
encoder = Caesar.new(3)

# encode file
character_array = []
File.open('plain.txt','r') {|file_reader|
  file_reader.each_byte(){|byte| character_array.push(byte.chr)}
}
encoded_character_array = []
character_array.each do |character|
  encoded_character_array.push(encoder.encode(character))
end
File.open('encoded.txt','w') {|file_writer|
  encoded_character_array.each{|character|
    print character
    file_writer << character}
}
puts

# decode file
character_array = []
File.open('encoded.txt','r') {|file_reader|
  file_reader.each_byte(){|byte| character_array.push(byte.chr)}
}
decoded_character_array = []
character_array.each do |character|
  decoded_character_array.push(encoder.decode(character))
end
File.open('decoded.txt','w') {|file_writer|
  decoded_character_array.each{|character|
    print character
    file_writer << character}
}
puts

#TODO die Klasse Caesar anwenden
# plain.txt auslesen und kodieren. Das Ergebnis soll in encoded.txt stehen
# Dann encoded.txt lesen und decodieren. Das Ergebnis soll in decoded.txt stehen
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
