def the_winner_takes_it_all(benoetigte_anzahl_sechsen)
  gewuerfelte_sechsen = 0
  while gewuerfelte_sechsen < benoetigte_anzahl_sechsen
    if rand(6) + 1 == 6
      gewuerfelte_sechsen = gewuerfelte_sechsen + 1
    else
      break
    end
  end
  return gewuerfelte_sechsen
end

puts "Bitte geben Sie die Anzahl der fuer einen Gewinn noetigen Sechsen an!"
n = gets.chomp.to_i

gebrauchte_versuche = 0
ergebnis = 0
while ergebnis < n
  ergebnis = the_winner_takes_it_all(n)
  gebrauchte_versuche = gebrauchte_versuche + 1
end

puts 'Du hast ein iPhone gewonnen und grade einmal ' + gebrauchte_versuche.to_s + ' Versuche gebraucht!'
if gebrauchte_versuche > 1000
  puts 'Bei einem angenommenen Preis von 50 Cent pro Versuch, hast du ' + (gebrauchte_versuche / 2.0).to_s +
  " Euro fuer ein Geraet ausgegeben, \ndas im Laden in etwa 600 bis 700 Euro kostet!"
  puts 'Geh fuer dein Gluecksspiel wenigstens zu einem Wohlfahrtsverein, du Genie!'
end