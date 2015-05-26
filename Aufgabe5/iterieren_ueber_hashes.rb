def max_key(a_hash)
  return a_hash.keys.max
end

def max_value(a_hash)
  return a_hash.values.max
end

def count_max_values(a_hash)
  return a_hash.values.count(max_value(a_hash))
end

def key_value_sum_even(a_hash)
  return a_hash.select { |key, value|
    (key + value) % 2 == 0
  }
end

h = {:a=> 7, :b=> 11, :c=> 6, :d=> 11, :e=> 11, :f => 9}
puts count_max_values({:a=> 7, :b=> 11, :c=> 6, :d=> 11, :e=> 11, :f => 9})

puts max_key(h)
puts max_value(h)

h = {3=> 7, 4=> 11, 2=> 6, 5=> 11, 6=> 11, 8 => 9}

puts key_value_sum_even({3=> 7, 4=> 11, 2=> 6, 5=> 11, 6=> 11, 8 => 9})