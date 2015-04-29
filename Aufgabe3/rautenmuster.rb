def diamond(n)
  if n.integer? == false || n % 2 == 0
    puts n.to_s + ' ist keine ungerade Zahl, Bloedmann!'
    exit(-9)
  end
  
  for zeile in 0 .. n - 1
    
    if zeile < n / 2
      delta = zeile
    else
      delta = n - zeile - 1
    end
    
    for spalte in 0 .. n - 1
      if  (spalte == n / 2 - delta || spalte == n / 2 + delta)
        print '*'
      elsif (spalte < n / 2 - delta || spalte > n / 2 + delta) 
        print '-'
      else
        print' '
      end
    end
    
    puts ''
  end
  
end

puts 'Bitte geben Sie eine ungerade natuerliche Zahl, nach der ein Diamant erstellt wird, an!'
diamand(gets.chomp.to_i)

#diamond(1)
#diamond(3)
#diamond(5)
#diamond(23)
#diamond(17)
#diamond(2)