class Field
  def initialize(n)
    if !n.integer? || n < 0
      raise ArgumentError, 'n muss ein Element von N+ sein!', caller
    end
    @n = n
    @field = []

    for row in 0 .. @n - 1
      @field.push([])
      for column in 0 .. @n - 1
        @field[row].push(rand(100))
      end
    end
    
    # set start
    @field[1][1] = 's'
    # set goal
    @field[@n - 2][@n - 2] = 'f'
      
    @grid = grid(@n)
    to_s
  end

  def get_entry(row, column, entry_length)
    string = @field[row][column].to_s
    if string.length == entry_length
      return string
    else
      leading_blanks = ''
      for i in 0 .. entry_length - string.length - 1
        leading_blanks += ' '
      end
      return leading_blanks + string
    end
  end

  def grid(n)
    grid = []
    entry_length = 2
    for row in 0 .. n * 2
      grid.push('')
      column = 0
      while column < n * (entry_length + 1) + 1
        if column % (entry_length + 1) == 0 && row % 2 == 0
          grid[row] += '+'
        elsif row % 2 == 0
          grid[row] += '-'
        elsif column % (entry_length + 1) == 0
          grid[row] += '|'
        else
          grid[row] += get_entry(row / 2, column / (entry_length + 1), entry_length)
          column += entry_length - 1
        end
        column += 1
      end
    end
    return grid
  end

  def update_grid

  end

  def to_s
    update_grid
    @grid.each do |row|
      puts  row
    end
  end
end

field = Field.new(5)