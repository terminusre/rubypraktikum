class Adresse
  attr_reader :name,:strasse,:ort
  def initialize(name,strasse,ort)
    @name = name
    @strasse = strasse
    @ort = ort
  end

  def ==(other)
    return true if self.equal?(other)
    return false if other.nil?()
    return false if self.class != other.class
    return [name(),strasse(),ort()]==[other.name(),other.strasse(),other.ort()]
  end

  def eql?(other)
    return true if self.equal?(other)
    return false if other.nil?()
    return false if self.class != other.class
    return [name(),strasse(),ort()].eql?([other.name(),other.strasse(),other.ort()])
  end

  def hash()
    return [name(),strasse(),ort()].hash()
  end
end