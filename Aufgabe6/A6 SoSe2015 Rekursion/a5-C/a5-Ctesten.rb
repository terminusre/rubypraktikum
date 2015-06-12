require "A6 SoSe2015 Rekursion/a5-C/a5-C"

def f_test(x)
  iterationen = 100
  puts 'Test 1/(1+x)^2-Approximation'
  puts 'Die Abweichung betraegt bei ' + iterationen.to_s + ' Iterationen: ' + ((1 / ((1 + x) ** 2)) - f(iterationen, x)).to_s
end

f_test(-0.5)
f_test(0.7)

def ln_test(x)
  iterationen = 100
  puts 'Test ln-Approximation'
  puts 'Die Abweichung betraegt bei ' + iterationen.to_s + ' Iterationen: ' + (Math::log(x) - ln(iterationen, x)).to_s
end

ln_test(3.5)

