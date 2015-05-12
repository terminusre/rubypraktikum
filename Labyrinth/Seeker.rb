require 'Field'
require 'Vector'

class Seeker
  def initialize(field)
    @field = field
    @n = @field.n
    @starting_position = find_start
  end

  def find_start
    starting_position = nil
    for row in 0 .. @n - 1
      for column in 0 .. @n - 1
        if @field[row, column] == 's'
          starting_position = Vector.new(row, column)
        end
      end
    end
    if starting_position != nil
      return starting_position
    else
      exit(-9)
    end
  end

  def seek_goal
    traces = []

  end
end

field = Field.new(5)
puts field
seeker = Seeker.new(field)
seeker.seek_goal