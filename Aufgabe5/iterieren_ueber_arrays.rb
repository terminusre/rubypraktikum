def sin_auf_array(ary)
  return ary.map{ |i| Math::sin(i)}
end

def kreuzprodukt(ary1,ary2)
  ary = []
  ary1.each{ |element1|
    if ary2 != []
      ary2.each { |element2|
        ary.push([element1, element2])
      }
    end
  }
  return ary
end

def durch_drei_teilbar_und_groesser_als_sieben(array)
  return array.map{ |number| ((number % 3 == 0) && (number > 7)) }.reduce(:&)
end

def gerade_und_groesser_null(array)
  return array.find_all { |i| (i % 2 == 0) && (i > 0)}
end

p sin_auf_array([Math::PI, Math::PI/2, 2, 1.5, 7.8])
p kreuzprodukt([1,2,3],[:a,:b])
p kreuzprodukt([],[:a,:b])
p kreuzprodukt([1,2,3],[])
p durch_drei_teilbar_und_groesser_als_sieben([9, 12, 15, 16])
p durch_drei_teilbar_und_groesser_als_sieben([9, 12, 15, 300])
p gerade_und_groesser_null([2, 4, 7, 9, 10, -2])