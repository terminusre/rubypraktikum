require "f/Adresse"

class Brief
  attr_reader :adressat,:absender,:inhalt
  def initialize(adressat, absender, inhalt)
    @adressat = adressat
    @absender = absender
    @inhalt = inhalt
  end

  def ==(other)
    return true if self.equal?(other)
    return false if other.nil?()
    return false if self.class != other.class
    return [adressat(),absender(),inhalt()]==[other.adressat(),other.absender(),other.inhalt()]
  end

  def eql?(other)
    return true if self.equal?(other)
    return false if other.nil?()
    return false if self.class != other.class
    return [adressat(),absender(),inhalt()].eql?([other.adressat(),other.absender(),other.inhalt()])
  end

  def hash()
    [adressat(),absender(),inhalt()].hash()
  end

end


