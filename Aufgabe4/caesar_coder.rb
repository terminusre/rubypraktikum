class Caesar
  def initialize()
  end

  def encode(string)
    offset = 1
    cipher = string.clone
    for i in 0 .. cipher.length - 1
      cipher[i] = (cipher[i].ord + offset).chr
      if cipher[i].ord > 'Z'.ord
        cipher[i] = (cipher[i].ord - 26).chr
      end
    end
    return cipher
  end
end

c = Caesar.new
s = 'HALLOZ'
puts c.encode(s)
puts s

#TODO die Klasse Caesar anwenden
# plain.txt auslesen und kodieren. Das Ergebnis soll in encoded.txt stehen
# Dann encoded.txt lesen und decodieren. Das Ergebnis soll in decoded.txt stehen