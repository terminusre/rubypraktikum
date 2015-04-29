def grades(notenpunkte)
  if notenpunkte.integer?
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
  else
    "Das ist keine Zensur, Schwachkopf! => deine geistige Leistung = 'ungenuegend'"
  end
  puts ergebnis
end

puts 'Bitte geben Sie eine Zahl zwischen 0 und 15, die in eine Zensur umgewandelt wird, an!'


grades(gets.chomp.to_i)

grades(0)
grades(1)
grades(6)
grades(8)
grades(12)
grades(15)
grades(16)