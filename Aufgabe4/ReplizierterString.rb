class ReplizierterString
  def initialize(wort, zaehler)
    @wort = wort
    @zaehler = zaehler
  end

  def kopieren
    return ReplizierterString.new(@wort, @zaehler)
  end

  def to_s
    absoluter_string = ''
    for i in 0 .. @zaehler - 1
      absoluter_string = absoluter_string + @wort
    end
    return absoluter_string
  end

  def ==(other_rep_string)
    return self.to_s == other_rep_string.to_s
  end

  def normalized?
    check_string = ''
    for i in 0 .. @wort.length - 1
      check_string += @wort[i]
      # TODO
    end
    return false
  end

  # TODO
  def normalize

    return self
  end

  def <<(a_string)
    @wort = @wort + a_string
  end

  def +(wert)
    @zaehler += wert
  end

  def <(other_rep_string)
    return other_rep_string.to_s[0 .. other_rep_string.to_s().length - 2].start_with?(self.to_s)
  end

end

#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#

