def summe1(i)
  if i.integer? && i > 0
    return (0..i+1).inject {|sum, i|
      sum+(1/(2.0**(i-1)))
    }
  else
    return -99
  end
end

def approx_1_halb(i)
  if i.integer? && i > 1
    return (0..i).inject{|sum,i|
      sum+(1/((2.0*i-1)*(2.0*i+1)))
    }
  else
    return -99
  end
end

def approx_ln(x, n)
  if !x.integer? && n.integer? && n > 1 && x > 0 && x <= 2
    return (0..n).inject{|sum,i|
      sum+((-1.0)**(i+1))*(((x-1.0)**i)/i)
    }
  else
    return -99
  end
end

puts summe1(1)
puts approx_1_halb(50)
puts approx_ln(1.1,5)
