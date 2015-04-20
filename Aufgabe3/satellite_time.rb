def satellite_time(sekunden)
  rest = sekunden
  s = rest % 60
  rest = rest / 60
  m = rest % 60
  rest = rest / 60
  h = rest % 24
  rest = rest / 24
  d = rest % 60
  puts d.to_s + ' ' + h.to_s + ' ' + m.to_s + ' ' + s.to_s 
end

#satellite_time(100000)
puts 'Bitte geben Sie die Anzahl von Sekunden an, die Sie in Satillitenzeit umgerechnet haben moechten!'
satellite_time(gets.chomp.to_i)