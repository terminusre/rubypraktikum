def grades(notenpunkte)
  if notenpunkte.integer? == false || notenpunkte < 0 || notenpunkte > 15
    puts "Das ist keine Zensur, Schwachkopf! => deine geistige Leistung = 'ungenuegend'"
    exit(-9)
  end
  ergebnis = case notenpunkte
  when 0 then 'ungenuegend'
  when 1..3 then 'mangelhaft'
  when 4..6 then 'ausreichend'
  when 7..9 then 'befriedigend'
  when 10..12 then 'gut'
  when 13..15 then 'sehr gut'
  end
  puts ergebnis
end

puts 'Bitte geben Sie eine  Zahl zwischen 0 und 15, die ein eine Zensur umgewandelt wird, an!'
diamand(gets.chomp.to_i)
  
grades(0)
grades(1)
grades(6)
grades(8)
grades(12)
grades(15)
grades(16)