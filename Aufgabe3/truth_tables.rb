def truth_tables
  for zeile in 0 .. 3
    for spalte in 0 .. 3
      if zeile < 2 && spalte < 2
        # erster Quadrant = AND
        #print 'a'
        if zeile % 2 == 1 && spalte % 2 == 1
          print '1'
        else
          print '0'
        end
      elsif zeile < 2 && spalte > 1
        # zweiter Quadrant = OR
        if zeile % 2 == 1 || spalte % 2 == 1
          print '1'
        else
          print '0'
        end
      elsif zeile > 1 && spalte < 2
        # dritter Quadrant = NAND
        if !(zeile % 2 == 1 && spalte % 2 == 1)
          print '1'
        else
          print '0'
        end
      else
        # vierter Quadrant = NOR
        if !(zeile % 2 == 1 || spalte % 2 == 1)
          print '1'
        else
          print '0'
        end
      end
    end
    puts ''
  end
end

truth_tables