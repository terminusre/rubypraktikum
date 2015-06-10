require "A6 SoSe2015 Rekursion/a5-A/a5-A"
require "A6 SoSe2015 Rekursion/a5-B/a5-B"

def compare()
  abweichung = 1
  for n in 1 .. 100
    puts 'f(' + n.to_s + ')-f_sp(' + n.to_s + '): ' + (f(n) - f_sp(n)).to_s
    puts 'ln(2,' + n.to_s + ')-ln_sp(2,' + n.to_s + '): ' + (ln(2, n) - ln_sp(2, n)).to_s
  end
end

compare()