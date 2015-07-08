# TODO Naeherung fuer 1/4 iterativ
# Summe 5 PKt

def f_1_4tel_it(n)
  if !n.integer? || n < 1
    return false
  end
  summe = 0
  for i in 1 .. n
    summe += 1.0 / (i * (i + 1.0) * (i + 2.0))
  end
  return summe
end

# TODO Naeherung fuer 1/4 rekursiv
# Summe 5 Pkt
def f_1_4tel_rek(n)
  if !n.integer? || n < 1
    return false
  end

  def end_rek(i, s)
    if i > 0
      end_rek(i - 1, (1.0 / (i * (i + 1.0) * (i + 2.0))) + s)
    else
      return s
    end
  end
  return end_rek(n, 0)
end

# TODO Array erweitern ary_min_e_elems
# Summe 10 Pkt
class  Array
  def ary_min_2_elems
    counter = 0
    if self.length > 1
      counter += 1
    end
    self.each { |element|
      if element.is_a?(Array)
        counter += element.ary_min_2_elems
      end
    }
    return counter
  end
end

require "Set"

#t = [1,[2,[3,4],[[7,[8,9]]]]]
#print t.ary_min_2_elems
h1 = {:a1 => Set.new([:p1,:p2,:p3,:p4]), :a2 => Set.new([:p1,:p4,:p5,:p6]), :a3 => Set.new([:p1,:p2,:p3]) }

def organisiere_nach_wert(a_hash)
  new_hash = Hash.new
  a_hash.values.each { |set| set.each { |value| new_hash[value] = Set.new if !new_hash.key?(value)}}
  a_hash.each { |pair| pair[1].each { |val| new_hash[val].add(pair[0])}}
  return new_hash
end

def schluessel_pro_wert(a_hash)
  new_hash = Hash.new
  organisiere_nach_wert(a_hash).each { |pair| new_hash[pair[0]] = pair[1].length }
  return new_hash
end

## TODO  Methode organisiere_nach_wert(a_hash) 6 Pkt
#def organisiere_nach_wert(a_hash)
#  other_hash = Hash.new
#
#  a_hash.values.map{|set| set.to_a}.flatten.each { |new_key|
#    if !other_hash.key?(new_key)
#      other_hash.store(new_key, Set.new)
#    end
#  }
#
#  a_hash.each {|pair|
#    pair[1].each { |value|
#      other_hash[value].add(pair[0])
#    }
#  }
#
#  return other_hash
#end

## TODO Methode schluessel_pro_wert(h) 4 Pkt
#def schluessel_pro_wert(a_hash)
#  other_hash = Hash.new
#
#  a_hash.values.map{|set| set.to_a}.flatten.each { |new_key|
#    if !other_hash.key?(new_key)
#      other_hash.store(new_key, 0)
#    end
#  }
#
#  a_hash.each {|pair|
#    pair[1].each { |value|
#      other_hash[value] += 1
#    }
#  }
#
#  return other_hash
#end
