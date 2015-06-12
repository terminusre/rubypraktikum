def f_sp(n, speicher = 0)
  if n < 1
    return speicher
  else
    return f_sp(n - 1, speicher + (1.0 / (n * (n + 1.0) * (n + 2.0))))
  end
end

def ln_sp(x, n, speicher = 0)
  if n < 0
    return speicher
  else
    return ln_sp(x, n - 1, speicher +
    (2.0 * ((x - 1.0) ** (2.0 * n + 1.0)) /
    (((2.0 * n + 1.0) * ((x + 1.0) ** (2.0 * n + 1.0))))))
  end
end

#puts f_sp(100)

#puts ln_sp(10, 100)