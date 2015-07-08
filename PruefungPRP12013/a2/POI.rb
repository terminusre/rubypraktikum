class POI
  include Comparable
  attr_reader :geo_coord, :attachments, :name
  protected :attachments
  def initialize(name, geo_coord)
    @name = name
    @geo_coord = geo_coord
    @attachments = []
  end

  def <<(attachment)
    if !attachment.is_a?(Attachment)
      return self
    end
    if !(@attachments.include?(attachment))
      @attachments << attachment
    end
    return self
  end

  def to_s()
    return "POI(#@name,#@geo_coord,\{#{@attachments.sort().join(",")}\}"
  end

  def ==(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return [@name, @geo_coord, @attachments.sort] == [other.name, other.geo_coord, other.attachments.sort]
  end

  def hash
    return to_s.hash
  end

  def eql?(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return [@name, @geo_coord, @attachments.sort].eql?([other.name, other.geo_coord, other.attachments.sort])
  end

  def <=>(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return [@name, @geo_coord, @attachments.sort] <=> [other.name, other.geo_coord, other.attachments.sort]
  end
end

class Geokoordinate
  include Comparable
  attr_reader :bg, :lg
  def initialize(breitengrad,laengengrad)
    @bg = breitengrad
    @lg = laengengrad
  end

  def to_s()
    return "(#@bg,#@lg)"
  end

  def ==(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return [@bg, @lg] == [other.bg, other.lg]
  end

  def hash
    return to_s.hash
  end

  def eql?(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return [@bg, @lg].eql?([other.bg, other.lg])
  end

  def <=>(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return [@bg, @lg] <=> [other.bg, other.lg]
  end

end

class Attachment
  include Comparable
  attr_reader :name, :inhalt
  def initialize(name,inhalt)
    @name = name
    @inhalt = inhalt
  end

  def to_s()
    "At[#@name,#@inhalt]"
  end

  def ==(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return [@name, @inhalt] == [other.name, other.inhalt]
  end

  def hash
    return to_s.hash
  end

  def eql?(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return [@name, @inhalt].eql?([other.name, other.inhalt])
  end

  def <=>(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return [@name, @inhalt] <=> [other.name, other.inhalt]
  end
end
