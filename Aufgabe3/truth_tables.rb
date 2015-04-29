def truth_tables
  for zeile in 0 .. 3
    for spalte in 0 .. 3
      if zeile < 2 && spalte < 2
      # erster Quadrant = AND
        print 'a'
      elsif zeile < 2 && spalte > 1
      # zweiter Quadrant = OR
        print 'b'
      elsif zeile > 1 && spalte < 2
      # dritter Quadrant = NAND
        print 'c'
      else
      # vierter Quadrant = NOR
        print 'd'
      end
    end
    puts ''
  end
end

truth_tables