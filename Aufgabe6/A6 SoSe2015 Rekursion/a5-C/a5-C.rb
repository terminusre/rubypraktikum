def ln(n, x, speicher = 0)
  if n == 1
    return speicher + ((x - 1) / x)
  else
    return ln(n - 1, x, speicher + ((x - 1) ** n) / (n * (x ** n)))
  end
end

def f(n, x, speicher = 0)
  if n == 0
    return speicher + 1
  else
    return f(n - 1, x, speicher + ((-1 ** n) * (n + 1) * (x ** n)))
  end
end

#puts ln(100, 0.6)
#puts Math::log(0.6)
#
#z =  0.7
#puts 1.0 / ((1.0 + z) ** 2)
#puts f(100, z)