def summe1(n)
  if n.integer? == false || n < 1
    puts 'Das ist kein zulaessiger Wert, Depp!'
    exit(-99)
  end
  ergebnis = 0.0
  i = 1.0
  while i < n + 1
    ergebnis = ergebnis + (1.0 / (i**2 + 1))
    i = i + 1
  end
  return ergebnis
end

def summe2(n, x)
  if n.integer? == false || n < 1
    puts 'Das ist kein zulaessiger Wert, Depp!'
    exit(-99)
  end
  ergebnis = 0.0
  i = 0
  while i < n +1
    ergebnis = ergebnis + ((x + i) / (x**3 + i + 0.0))
    i = i + 1
  end
  return ergebnis
end

def summe3(n, x)
  ergebnis = 0.0
  i = 1
  while i < n + 1
    ergebnis = ergebnis + (x**(1.0/i) / summe3_nenner(i, x))
    i = i + 1
  end
  return ergebnis
end

def summe3_nenner(i, x)
  ergebnis = 0.0
  j = 1.0
  while j < i + 1
    ergebnis = ergebnis + ((x - j) / (x + j))
    j = j + 1
  end
  return ergebnis
end

for i in 1 .. 1000
  puts summe1(i)
end
for i in 0 .. 999
  puts summe2(10, 5)
end
for i in 0 .. 999
  puts summe3(10, 4.4)
end