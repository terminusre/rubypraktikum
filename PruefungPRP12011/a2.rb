# 26 Pkt
# 4 Pkt für sortiere_absteigend_nach_strasse_hnr

#TODO Klasse um die Methoden ergänzen
class Adresse
  include Comparable
  attr_reader :strasse, :hnr, :plz, :ort
  def initialize(strasse,hnr,plz,ort)
    @strasse = strasse
    @hnr = hnr
    @plz = plz
    @ort = ort
  end

  def to_s()
    "A(#@strasse,#@hnr,#@plz,#@ort)"
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    raise ArgumentError if !other.is_a?(self.class)
    return [@plz, @ort, @strasse, @hnr] == [other.plz, other.ort, other.strasse, other.hnr]
  end

  def <=>(other)
    return false if other.nil?
    raise ArgumentError if !other.is_a?(self.class)
    return [@plz, @ort, @strasse, @hnr] <=> [other.plz, other.ort, other.strasse, other.hnr]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    raise ArgumentError if !other.is_a?(self.class)
    return [@plz, @ort, @strasse, @hnr].eql?([other.plz, other.ort, other.strasse, other.hnr])
  end

  def hash
    return to_s.hash
  end
end

def sortiere_absteigend_nach_strasse_hnr(adresse_ary)
  return adresse_ary.sort{ |a, b| [b.strasse, b.hnr] <=> [a.strasse, a.hnr] }
end