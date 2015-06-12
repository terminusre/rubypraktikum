require "A6 SoSe2015 Rekursion/a5-A/a5-A"

def f_test()
  abweichung = 1
  zaehler = 0
  while abweichung > 0.000001
    zaehler += 1
    abweichung = (0.25 - f(zaehler)).abs # Betrag
  end
  puts 'Die Abweichung betraegt ' + abweichung.to_s + ' im ' + zaehler.to_s + '. Durchlauf.'
end

f_test()

def ln_test(x)
  ln2 = Math::log(2)
  abweichung = 1
  zaehler = 0
  while abweichung > 1e-15 #10**-15
    zaehler += 1
    abweichung = (ln2 - ln(2, zaehler)).abs
  end
  puts 'Die Abweichung betraegt ' + abweichung.to_s + ' im ' + zaehler.to_s + '. Durchlauf.'

end

ln_test(2)

#
def ack_test()
end

#ack_test3() Ackermann mit n=3
def ack_test3()
end

