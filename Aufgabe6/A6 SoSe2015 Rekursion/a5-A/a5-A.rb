def f(n)
  if n == 1
    return 1.0 / 6
  else
    return (1.0 / (n * (n + 1.0) * (n + 2.0))) + f(n - 1)
  end
end

def ln(x, n)
  if n == 0 && x > 0
    return 2.0 * (x - 1.0) / (x + 1.0)
  else
    return (2.0 * ((x - 1.0) ** (2.0 * n + 1.0)) /
    (((2.0 * n + 1.0) * ((x + 1.0) ** (2.0 * n + 1.0))))) +
    ln(x,n-1)
  end
end

def a(n, m)
  if n == 0
    return m + 1
  elsif m == 0
    return a(n - 1, 1)
  else
    return a(n - 1, a(n, m - 1))
  end
end


#puts f(100)
#puts Math::log(10)
#puts ln(10,100)
#for i in 3 .. 100
#  puts a(i, i)
#end