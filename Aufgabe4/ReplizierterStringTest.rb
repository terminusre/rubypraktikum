require "test/unit"
require "ReplizierterString"

class ReplizierterStringTest < Test::Unit::TestCase
  def setup()
    @empty_string = ""
    @jaajaa_3 = "jaajaajaajaajaajaa"
    @rp0_1 = ReplizierterString.new("jaajaa",0)
    @rp0_2 = ReplizierterString.new("",6)
    @rp1 = ReplizierterString.new("jaajaa",3)
    @rp2 = ReplizierterString.new("jajaja",2)
    @rp3 = ReplizierterString.new("kk",6)
    @rp1_6 = ReplizierterString.new("jaa",6)
    @rp1_5 = ReplizierterString.new("jaa",5)
    @rp1_1 = ReplizierterString.new("jaajaajaajaajaajaa",1)
    @rp4 = ReplizierterString.new("jahu",1)
    @rp5 = ReplizierterString.new("jaajaa",2)
  end

  # Testet, ob die Bedg, dass der Zähler >= 0 sein muss, korrekt behandelt wird
  def test_initialize
    assert_raises(ArgumentError) {ReplizierterString.new("hu",-7)}
  end

  # Testet, ob das Kopieren eine echte Kopie von self erzeugt
  def test_kopieren()
    rp1_kopie = @rp1.kopieren()
    assert(rp1_kopie.wort==@rp1.wort && rp1_kopie.zaehler()== @rp1.zaehler(),"Keine korrekte Kopie des Inhalt")
    assert(!@rp1_kopie.equal?(@rp1), "Keine Kopie: es wurde nur eine Referenz auf self erzeugt")
  end

  # Testet, ob die ausgeschriebene Form korrekt erzeugt wird
  def test_to_s()
    assert_equal(@empty_string,@rp0_1.to_s(),"Keine korrekte Aufbereitung, wenn Zaehler 0 ist")
    assert_equal(@empty_string,@rp0_2.to_s(), "Keine korrekte Aufbereitung, wenn Wort das leere Wort ist")
    assert_equal(@jaajaa_3,@rp1.to_s(),"Keine korrekte Aufbereitung fuer nicht leere replizierte Strings")
  end

  # Testet, ob die Gleichheitsrelation korrekt arbeitet
  def test_wertgleichheit()
    assert(@rp1==@rp1,"Keine korrekte Pruefung fuer identische Objekte")
    assert(@rp1==@rp1_6, "Keine korrekter Vergleich fuerr inhaltsgleiche Objekte")
    assert(@rp1==@rp1_1, "Keine korrekter Vergleich für inhaltsgleiche Objekte")
    assert_equal(false,@rp1==@rp5, "Fehler: Gleichheit für ungleiche Objekte")
    assert(@rp0_1==@rp0_2,"Keine korrekte Prüfung bei 0-Zaehler und leerem Wort")
    # Arbeitet der Vergleich auch mit Objekten anderen Typs korrekt
    assert_nothing_raised("Test auf Wertgleichheit mit Objekten anderen Typs darf keinen Fehler werfen"){!(@rp1==7)}
  end

  def test_normalize()
    rp1_kopie = @rp1.kopieren()
    assert_equal(rp1_kopie.normalize(),@rp1)
    assert_equal("jaa",rp1_kopie.wort(),"Normalisierung hat nicht das kleinste Teilwort ermittelt")
    assert_equal(6,rp1_kopie.zaehler(),"Normalisierung hat den Zähler nicht maximiert")
    assert_same(@rp0_1,@rp0_1.normalize(),"Fehler: Normalisierung von leeren Zeichenketten darf self nicht verändern.")
    assert_same(@rp0_2,@rp0_2.normalize(),"Fehler: Normalisierung von leeren Zeichenketten darf self nicht verändern.")
    # Arbeitet die Methoden destruktiv, wird self verändert? 
    rp1_norm = @rp1.normalize()
    assert_same(rp1_norm,@rp1, "Normalize muss destruktiv arbeiten/self verändern!")
  end

  def test_normalized?()
    assert(!@rp1.normalized?(),"#{@rp1.inspect()} ist nicht normalisiert")
    assert(!@rp1_1.normalized?(),"#{@rp1_1.inspect} ist nicht normalisiert")
    assert(!@rp2.normalized?(),"#{@rp2.inspect()} ist nicht normalisiert")
    assert(!@rp3.normalized?(),"#{@rp3.inspect()} ist nicht normalisiert")
    assert(@rp4.normalized?(),"#{@rp4.inspect()} ist nicht normalisiert")
    assert(@rp1_1.normalize().normalized?(), "Prüfung schlägt nach der Normalisierung fehl")
  end
  
  def test_plus()
    wort_3 = @rp3.wort()
    assert_equal(8,(@rp3+2).zaehler,"Addition arbeitet nicht korrekt/Zaehler nicht korrekt inkrementiert")
    assert_equal(wort_3,(@rp3+2).wort,"Addition darf das Wort nicht veraendern.")
    assert_raises(ArgumentError){@rp1+(-7)}
    # Arbeitet die Methoden destruktiv, wird self verändert?
    assert_equal(@rp1,@rp1+8,"Addition muss self veraendern")
    # Addition mit "leeren" Zeichenketten korrekt
    assert_equal(2,(@rp0_1+2).zaehler(),"Addition muss auch den Zaehler von leeren replizierten Strings veraendern!")
    assert_equal(8,(@rp0_2+2).zaehler(),"Addition muss auch den Zaehler von leeren replizierten Strings veraendern!")
  end
  
  def test_push()
    zaehler_3 = @rp3.zaehler()
    assert_equal("kkk",(@rp3<<"k").wort(),"Push muss das Wort veraendern!")
    assert_equal(zaehler_3,(@rp3<<"k").zaehler(),"Push darf den Zaehler nicht veraendern!")
    # Arbeitet die Methoden destruktiv, wird self verändert?
    assert_equal(@rp1,@rp1<<"bla","Push muss self veraendern!")
    # Push mit "leeren" Zeichenketten korrekt
    assert_equal("jaajaa7",(@rp0_1<<"7").wort(),"Push muss auch das Wort von leeren replizierten Strings veraendern!")
    assert_equal("7",(@rp0_2<<"7").wort(),"Push muss auch das Wort von leeren replizierten Strings veraendern!")
  end
  
  def test_less()
    assert(!(@rp0_1<@rp0_2),"Leere Zeichenketten sind gleich")
    assert(!(@rp1 < @rp2), "Nicht vergleichbare Zeichenketten koennen nicht kleiner sein")
    assert(@rp1_5<@rp1,"#{@rp1_5} ist kleiner #{@rp1}")    
  end
  
end

