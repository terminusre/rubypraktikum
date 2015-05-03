class ReplizierterString
  attr_reader :wort, :zaehler
  def initialize(wort, zaehler)
    if zaehler < 0
      raise ArgumentError, 'Der Zaehler ist negativ!', caller
    end
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
    if other_rep_string.is_a?(ReplizierterString)
      return ((self < (other_rep_string.clone + 1)) && (@wort.length * @zaehler == other_rep_string.wort.length * other_rep_string.zaehler)) ||
      (@wort.length * @zaehler == 0 && other_rep_string.wort.length * other_rep_string.zaehler == 0)
    end
    return false
  end

  def vielfaches(prefix, string, counter)
    if string == '' && counter > 1
      return counter
    elsif string.start_with?(prefix)
      return vielfaches(prefix, string[prefix.length .. -1], counter + 1)
    else
      return false
    end
  end

  def normalized?
    check_string = ''
    for i in 0 .. (@wort.length / 2) - 1
      check_string += @wort[i]
      if vielfaches(check_string, @wort, 0)
        return false
      end
    end
    return true
  end

  def normalize
    check_string = ''
    for i in 0 .. (@wort.length / 2) - 1
      check_string += @wort[i]
      faktor = vielfaches(check_string, @wort, 0)
      if faktor
        @zaehler *= faktor
        @wort = check_string
        break
      end
    end
    return self
  end

  def <<(a_string)
    @wort = @wort + a_string
    return self
  end

  def +(wert)
    if @zaehler + wert < 0
      raise ArgumentError, 'Der Zaehler wird durch diesen Wert negativ!', caller
    end
    @zaehler += wert
    return self
  end

  def <(other_rep_string)
    if other_rep_string != ''
      checkstring = other_rep_string.wort
      if checkstring.length < @wort.length
        checkstring += checkstring
      end
      if checkstring.start_with?(@wort) && @wort.length * @zaehler < other_rep_string.wort.length * other_rep_string.zaehler
        return true
      end
    end
    return false
  end

end

rp = ReplizierterString.new("jaajaa",3)
rp2 = ReplizierterString.new("jajaja",2)
rp3 = ReplizierterString.new("kk",6)
rp4 = ReplizierterString.new("jahu",1)
puts rp.normalized?() # false
puts rp2.normalized?() # false
puts rp3.normalized?() # false
puts rp4.normalized?() # true
p rp.normalize() # #<ReplizierterString:0x00000003179230 @wort="jaa", @zaehler=6>
p rp2.normalize() # #<ReplizierterString:0x000000031791e0 @wort="ja", @zaehler=6>
p rp3.normalize() # #<ReplizierterString:0x00000003179190 @wort="k", @zaehler=12>
puts rp2 # jajajajajaja
puts rp3 # kkkkkkkkkkkk
puts rp2.+(-2) # jajajaja
p rp2.<<("hu") # #<ReplizierterString:0x000000031791e0 @wort="jahu", @zaehler=4>
puts rp2 # jahujahujahujahu
rp4 = ReplizierterString.new("jahujahu",1)
puts rp2<rp4 # false
puts rp4<rp2 # true
