
puts "\nEine Datei zeichenweise lesen und darstellen"

File.open("plain.txt","r") {|fr|
  # each_byte liefert den Zeichencode eines jeden Zeichens 
  # der ASCII Tabelle also Zahlen.
  # Für die Caesar Codierung werden die Zeichencodes benötigt.
  fr.each_byte(){|b| print b}
}

puts "\nEine Datei zeichenweise lesen und Zeichen lesbar darstellen"
#
## Eine Datei zeichenweise auslesen
#
File.open('plain.txt','r') {|fr|
  # each_byte wie oben
  # Für die Ausgabe auf der Konsole und in die Datei werden Zeichen benötigt.
  # Durch Konkatenation mit dem leeren String ''<<b, werden die Zeichencodes
  # in 'lesbare' Zeichen gewandelt. 
  fr.each_byte(){|b| print ''<<b}
}

puts "\nEine Datei zeichenweise schreiben. Kontrollausgabe auf der Konsole"
#
## Eine Datei zeichenweise schreiben
#
File.open('random.txt','w') {|fw| 
  # rand(26)+65 erzeugt Zahlen im Intervall 65..90 (Zeichencodes für A..Z)
  # durch Konkatenation mit einem leeren String
  # ''<<rand(26)+65 werden diese Zeichencodes in lesbare Zeichen gewandelt.
  # In 'random.txt' stehen danach 100 Großbuchstaben 
  100.times(){|i|
    zeichen = ''<< rand(25)+65
    print zeichen
    fw << zeichen}
}
