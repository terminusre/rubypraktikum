def prime_factors(n)
  rest = n
  if rest < 2 || rest.integer? == false
    puts 'Ungueltige Eingabe, Dummkopf!'
    exit(-9)
  end
  print 'Die Primfaktoren von ' + n.to_s + ' sind: '
  i = 2
  while rest != 1
    if rest % i == 0
      rest = rest / i
      print i.to_s + ' '
    else
      i = i + 1
    end
  end
end

puts 'Bitte geben sie eine Zahl ein, die in ihre Primfaktoren zerlegt werden soll.'
prime_factors(gets.chomp.to_i)