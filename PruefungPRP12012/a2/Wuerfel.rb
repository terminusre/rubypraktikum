# Summe 26 Pkt + 4 Pkt fuer vollstaendige Gesamtloesung
class Wuerfel
  include Comparable
  attr_reader :kantenlaenge
  def initialize(kantenlaenge)
    @kantenlaenge = kantenlaenge
  end

  def to_s
    return 'Der Wuerfel hat die Kantenlaenge ' + @kantenlaenge + '.'
  end

  def ==(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return @kantenlaenge == other.kantenlaenge
  end

  def hash
    return kantenlaenge.hash
  end

  def eql?(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return @kantenlaenge.equal?(other.kantenlaenge)
  end

  def <=>(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return @kantenlaenge <=> other.kantenlaenge
  end
end