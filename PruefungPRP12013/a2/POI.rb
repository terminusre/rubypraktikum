class POI

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

  def hash
    return 1
  end

  # TODO
  def <=>(other)
    if other.nil?
      return false
    end
    #returnfalseifself.class!= other.class
    return[@name, @geo_coord, @attachments] <=> [other.name, other.geo_coord, other.attachments]
  end

  def ==(other)
    if other.nil?
      return false
    end
    return[@name, @geo_coord, @attachments] == [other.name, other.geo_coord, other.attachments]
  end

  def eql?(other)
    if other.nil?
      return false
    end
    if self.class!= other.class
      return false
    end
    return[@name, @geo_coord, @attachments] == [other.name, other.geo_coord, other.attachments]
  end

end

class Geokoordinate
  attr_reader :bg, :lg
  def initialize(breitengrad,laengengrad)
    @bg = breitengrad
    @lg = laengengrad
  end

  def to_s()
    return "(#@bg,#@lg)"
  end

  def hash
    return 1
  end

  def <=>(other)
    if other.nil?
      return false
    end
    if self.class!= other.class
      return false
    end
    return[@nbg, @lg] <=> [other.bg, other.lg]
  end

  def ==(other)
    if other.nil?
      return false
    end
    return[@nbg, @lg] == [other.bg, other.lg]
  end

  def eql?(other)
    if other.nil?
      return false
    end
    if self.class!= other.class
      return false
    end
    return[@nbg, @lg] == [other.bg, other.lg]
  end
  # TODO

end

class Attachment
  attr_reader :name,:inhalt
  def initialize(name,inhalt)
    @name = name
    @inhalt = inhalt
  end

  def to_s()
    "At[#@name,#@inhalt]"
  end

  def hash
    return 1
  end

  def <=>(other)
    if other.nil?
      return false
    end
    #returnfalseifself.class!= other.class
    return[@name, @inhalt] <=> [other.name, other.inhalt]
  end

  def ==(other)
    if other.nil?
      return false
    end
    return[@name, @inhalt] == [other.name, other.inhalt]
  end

  def eql?(other)
    if other.nil?
      return false
    end
    if self.class!= other.class
      return false
    end
    return[@name, @inhalt] == [other.name, other.inhalt]
  end

  # TODO
end

