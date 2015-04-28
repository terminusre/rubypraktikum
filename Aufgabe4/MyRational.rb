class MyRational
  attr_reader :zaehler, :nenner
  
  def initialize(zaehler,nenner)
    @zaehler = zaehler
    @nenner = nenner
  end
  
  def +(other)
    MyRational.new(@zaehler*other.nenner+other.zaehler*@nenner,@nenner*other.nenner).kuerzen()
  end
  
  def -(other)
    self+other.neg()
  end
  
  def *(other)
    MyRational.new(@zaehler*other.zaehler,@nenner*other.nenner).kuerzen()
  end
  
  def /(other)
    MyRational.new(@zaehler*other.nenner,@nenner*other.zaehler).kuerzen()
  end
  
  def neg()
    return MyRational.new(-@zaehler,nenner)
  end
  
  def reziprok()
    return MyRational.new(@nenner,@zaehler)
  end
  
  def to_s()
    rz = @zaehler
    rn = @nenner
    sign =''
    if @zaehler*1.0/@nenner < 0
      if @zaehler <0 ? rz = -@zaehler : rn = -@nenner
      end
      sign ="-"
    end
    "#{sign}#{rz}/#{rn}"
  end
  
  protected 
  def kuerzen()
    return MyRational.new(@zaehler/ggt(),@nenner/ggt())
  end
  
  # berechnet den größten gemeinsamen Teiler
  def ggt()
    if @zaehler > @nenner 
      ggt_(@zaehler,@nenner)
    else
      ggt_(@nenner,@zaehler)
    end
  end

  def ggt_(z1,z2)
    while !(z1%z2==0)
      r = z1%z2
      z1 = z2
      z2 =r 
      end
    return z2
  end  
end
