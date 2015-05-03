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
    #    return @wort + ' * ' + @zaehler.to_s
  end

  def ==(other_rep_string)
    return self.to_s == other_rep_string.to_s
  end

  def normalized?
    check_string = ''
    for i in 0 .. (@wort.length / 2) - 1
      wort = @wort
      check_string += @wort[i]
      if wort.gsub( /#{check_string}/, '') == ''
        return false
      end
    end
    return true
  end

  def normalize
    check_string = ''
    for i in 0 .. (@wort.length / 2) - 1
      wort = @wort
      check_string += @wort[i]
      if wort.gsub( /#{check_string}/, '') == ''
        wort = @wort
        subworte = wort.scan( /#{check_string}/)
        @wort = subworte[0]
        @zaehler *= subworte.length
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
    @zaehler += wert
    return self
  end

  def <(other_rep_string)
    return other_rep_string.to_s[0 .. other_rep_string.to_s().length - 2].start_with?(self.to_s)
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