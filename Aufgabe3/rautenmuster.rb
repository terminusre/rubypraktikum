def diamond(n)
  if n.integer? == false || n % 2 == 0
    puts n.to_s + ' ist keine ungerade Zahl, Bloedmann!'
    exit(-9)
  end
  zeile = 0
  spalte = 0
  while zeile < n
    
    while spalte < n
      if  (zeile <= n / 2 && (spalte == n / 2 - zeile || spalte == n / 2 + zeile)) || 
        (zeile > n / 2 && (spalte == zeile - n / 2 || spalte == n - (zeile - n / 2 + 1)))
        print '*'
      elsif (zeile < n / 2 && (spalte < n / 2 - zeile || spalte > n / 2 + zeile)) || 
        (zeile > n / 2 && (spalte < zeile - n / 2 || spalte > n - (zeile - n / 2 + 1)))
        print '-'
      else
        print' '
      end
      spalte = spalte + 1
    end
    
    puts ''
    spalte = 0
    zeile = zeile + 1
  end
end

puts 'Bitte geben Sie eine ungerade natuerliche Zahl, nach der ein Diamand erstellt wird, an!'
diamand(gets.chomp.to_i)

diamond(1)
diamond(3)
diamond(5)
diamond(23)
diamond(17)
diamond(2)