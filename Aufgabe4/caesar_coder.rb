class Caesar
  def initialize(d)
    if d < -26 || d > 26
      raise ArgumentError, 'Der Abstand d muss im offenen Intervall (-26,26) liegen!', caller
    end
    @d = d
  end

  def encode(byte)
    if byte >= 'A'.ord && byte <= 'Z'.ord
      return (((byte - 'A'.ord) + 26 + @d) % 26) + 'A'.ord
    else
      return byte
    end
  end
end

def read(file_name)
  byte_array = []
  File.open(file_name,'r') {|file_reader|
    file_reader.each_byte(){|byte|
      byte_array.push(byte)}
  }
  return byte_array
end

def write(file_name, byte_array)
  File.open(file_name,'w') {|file_writer|
    byte_array.each{|byte|
      file_writer << byte.chr}
  }
end

def print_byte_array(byte_array)
  byte_array.each do |byte|
    print byte.chr
  end
  puts
end

def encode(byte_array, d)
  caesar = Caesar.new(d)
  byte_array.collect! do |byte|
    caesar.encode(byte)
  end
end

# encode file
data = read('plain.txt')
encode(data, 3)
print_byte_array(data)
write('encoded.txt', data)

# decode file
data = read('encoded.txt')
encode(data, -3)
print_byte_array(data)
write('decoded.txt', data)