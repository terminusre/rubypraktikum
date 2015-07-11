# TODO Naeherung fuer ln(x) iterativ
# Summe 5 PKt
def ln_iter(x,n)

end

# TODO Naeherung fuer ln(x) (Math.log(x)) rekursiv
# Summe 5 Pkt
def ln_rek(x,n)

end

# TODO Array erweiteren collect_ary_plus_depth
# Summe 10 Pkt

# TODO Hash verknuepfen und auf injektiv pruefen
# Summe 10
class Hash
  def verknuepfe(other)
    new_hash = Hash.new
    self.each { |pair|
      if other.key?(pair[1])
        new_hash[pair[0]] = other[pair[1]]
      end
    }
    return new_hash
  end

  def injektiv?
    a = Hash.new
    self.values.each { |val| a[val] = 0 }

    self.each { |pair|
      if a.key?(pair[1])
        a[pair[1]] += 1
      end
    }
    print a
  end
end
