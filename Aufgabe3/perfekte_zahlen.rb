def teilersumme(n)
  ergebnis = 0
  for i in 1 .. (n / 2)
    if n % i == 0
      ergebnis = ergebnis + i
    end
  end
  return ergebnis
end

def ausgabe_der_teiler(n)
  # Berechnung
  ergebnis = []
  for i in 1 .. (n / 2)
    if n % i == 0
      ergebnis.push(i)
    end
  end
  # Ausgabe
  print n.to_s + ' = ' + ergebnis[0].to_s
  for j in 1 .. ergebnis.length - 1
    print ' + ' + ergebnis[j].to_s
  end
  puts ''
end

def perfekt?(n)
  if n == teilersumme(n)
    ausgabe_der_teiler(n)
    return true
  else
    return false
  end
end

puts "Bitte geben sie eine Zahl ein"
eingabe = gets.chomp.to_i # 6
puts perfekt?(eingabe)
gefundene_zahlen = 0
while gefundene_zahlen < 3
  eingabe = eingabe + 1
  if perfekt?(eingabe)
    gefundene_zahlen = gefundene_zahlen + 1
  end
end