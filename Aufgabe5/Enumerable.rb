module Enumerable

  def my_to_a()
  #TODO
  end

  def my_select(&b)
    # TODO
  end

  def my_min(&b)
    # TODO
  end

end

puts [1,2,4,5,-5,9].my_min(){|x,y| y<=>x}

p ({:a=> 7, :b=> 11, :c=> 6, :d=> 11, :e=> 11, :f => 9}).my_min(){|p1,p2| p2[0] <=> p1[0]}
  
p ({:a=> 7, :b=> 11, :c=> 6, :d=> 11, :e=> 11, :f => 9}).my_select(){|key,val| key > :c && val == 11}