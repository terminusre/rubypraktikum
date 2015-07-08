# Summe 26 Pkt + 4 Pkt fuer vollstaendige Gesamtloesung
class Wuerfel
  include Comparable
  attr_reader :kl
  def initialize(kl)
    @kl = kl
  end

  def to_s
    return "Die KantenlÃ¤nge des Wuerfels betrÃ¤gt: #{@kl}"
  end

  def ==(other)
    return false if other.nil?
    return true if other.equal?(self)
    return @kl == other.kl
  end

  def eql?(other)
    return false if other.nil?
    return false if !other.is_a?(self.class)
    return true if other.equal?(self)
    return @kl.eql?(other.kl)
  end

  def hash()
    @kl.hash()
  end

  def <=>(other)
    return false if other.nil?
    raise NoMethodError if !other.is_a?(self.class)
    return [@kl] <=> [other.kl]
  end

end

w1 = Wuerfel.new(1)
w1_0 = Wuerfel.new(1.0)
p w1<=w1_0