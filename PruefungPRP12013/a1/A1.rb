# TODO Naeherung fuer 1/4 iterativ
# Summe 5 PKt

def f_1_4tel_it(n)

end

# TODO Naeherung fuer 1/4 rekursiv
# Summe 5 Pkt
def f_1_4tel_rek(n)

end

# TODO Array erweitern ary_min_e_elems
# Summe 10 Pkt
class  Array
  def ary_min_2_elems
    return false
  end
end

# TODO  Methode organisiere_nach_wert(a_hash) 6 Pkt
def organisiere_nach_wert(a_hash)
  other_hash = Hash.new
  
  a_hash.values.map{|set| set.to_a}.flatten.each { |new_key|
    if !other_hash.key?(new_key)
      other_hash.store(new_key, Set.new)
    end
  }
  
  a_hash.each {|pair|
    pair[1].each { |value|
      other_hash[value].add(pair[0])
    }
  }
  
  return other_hash
end

require "Set"

# TODO Methode schluessel_pro_wert(h) 4 Pkt
def schluessel_pro_wert(h)

end