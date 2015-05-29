module Enumerable
  def my_to_a()
    array = []
    self.each{ |element| array.push(element)}
    return array
  end

  def my_select(&b)
    if block_given?
      array = []
      self.each { |element|
        if b.call(element)
          array.push(element)
        end
      }
      return array
    else
      return false
    end
  end

  def my_min(&b)
    if self != []
      if block_given?
        kleinstes = self[0]
        b.call(self)
        
#        self.each{|element|
#          if b.call(element)
#            kleinstes = b.call(element)
#          end
#        }

        return kleinstes
      else
        kleinstes = self[0]
        self.each { |element|
          if element < kleinstes
            kleinstes = element
          end
        }
        return kleinstes
      end
    else
      return nil
    end
  end

end

#print ({3=> 7, 4=> 11, 2=> 6, 5=> 11, 6=> 11, 8 => 9}).my_to_a
#puts
#puts [1,2,4,5,-5,9].my_min
puts [1,2,4,5,-5,9].my_min(){|x,y| x<=>y}
  
#puts [1,2,4,5,-5,9].min(){|x,y| x<=>y}
#
#p ({:a=> 7, :b=> 11, :c=> 6, :d=> 11, :e=> 11, :f => 9}).my_min(){|p1,p2| p2[0] <=> p1[0]}
#
#p ({:a=> 7, :b=> 11, :c=> 6, :d=> 11, :e=> 11, :f => 9}).my_select(){|key,val| key > :c && val == 11}

