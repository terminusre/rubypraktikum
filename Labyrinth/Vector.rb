class Vector
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(v)
    return Vector.new(@x + v.x, @y + v.y)
  end

  def -(v)
    return Vector.new(@x - v.x, @y - v.y)
  end

  def *(v)
    return Vector.new(@x * v.x, @y * v.y)
  end
  
  def to_s
    return @x.to_s + '/' + @y.to_s
  end
end