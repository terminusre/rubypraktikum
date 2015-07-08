# Gesamt 26 Pkt

# 8 Pkt
# Näherung von ln(x) berechnen für x > 0.5
def sum(x,n)
  #TODO
end

# 10 Pkt
class Array
  def rek_count_type(type)
    counter = 0
    self.each { |element|
      counter += 1 if element.is_a?(type)
      if element.is_a?(Array)
        counter += element.rek_count_type(type)
      end
    }
    return counter
  end
end

# 8 Pkt

def max_bestellwert(hash)
  max_val = 0
  max_key = nil
  hash.map { |pair|
    accumulator = 0.0
    pair[1].each { |element| accumulator += element}
    if max_val < accumulator
      max_val = accumulator
      max_key = pair[0]
    end
  }
  return max_key
end

