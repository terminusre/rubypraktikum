def summe1(n)
  if n.integer? == false || n < 1
    puts 'Das ist kein zulaessiger Wert, Depp!'
    exit(-99)
  end
  ergebnis = 0.0
  for i in 1 .. n
    ergebnis = ergebnis + (1.0 / (i**2 + 1.0))
  end
  return ergebnis
end

def summe2(n, x)
  if n.integer? == false || n < 0
    puts 'Das ist kein zulaessiger Wert, Depp!'
    exit(-99)
  end
  ergebnis = 0.0
  for i in 0 .. n
    ergebnis = ergebnis + ((x + i) / (x**3 + i + 0.0))
  end
  return ergebnis
end

def summe3(n, x)
  if n.integer? == false || n < 1
    puts 'Das ist kein zulaessiger Wert, Depp!'
    exit(-99)
  end
  if x.to_f - x.to_i == 0
    puts 'Der zweite Parameter ist eine ganze Zahl!'
    exit(-99)
  end
  
  ergebnis = 0.0
  for i in 1 .. n
    ergebnis = ergebnis + (x**(1.0/i) / summe3_nenner(i, x))
  end
  return ergebnis
end

def summe3_nenner(i, x)
  ergebnis = 0.0
  for j in 1 .. i
    ergebnis = ergebnis + ((x - j + 0.0) / (x + j + 0.0))
  end
  return ergebnis
end

for i in 1 .. 1000
  #  puts summe1(i)
  #  puts summe2(i, 5)
  puts summe3(i, 5.5)
end