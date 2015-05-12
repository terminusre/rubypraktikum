class Feld
  def initialize(n)
    if !n.integer? || n < 0
      raise ArgumentError, 'n muss ein Element von N+ sein!', caller
    end
    @n = n
    @feld = []
    @grid = ''
    for spalte in 0 .. @n - 1 # x-Koordinate
      @feld.push([])
      for zeile in 0 .. @n - 1 # y-Koordinate
        @feld[spalte].push([rand(100)])
      end
    end
    @grid = grid
    to_s
  end

  def grid
    grid = []
    for spalte in 0 .. (@n * 3) # x-Koordinate
      @feld.push('')
      for zeile in 0 .. (@n * 2) # y-Koordinate

        if zeile % 2 == 0
          @feld[spalte] += '-'
        elsif spalte % 3 == 0
          @feld[spalte] += ' '
        else
        end

      end
    end
    return grid
  end

  def update_grid

  end

  def to_s
    for i in 0 .. @n - 1
      puts grid[i]
    end
  end
end

feld = Feld.new(5)