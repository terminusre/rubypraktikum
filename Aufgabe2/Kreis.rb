require 'Point'
require 'Leinwand'
require 'Einstellungen'

class Kreis
  # initialize wird aufgerufen, wenn Instanzen der Klasse erzeugt werden
  # @xxxx sind die Instanzvariablen der Instanzen
  def initialize(mittelpunkt=Point.new(20,60),radius=15,farbe='red')
    # Alle Kreise haben ihren Mittelpunkt zu Beginn im Punkt 20,60
    # und einen Radius von 15
    @mittelpunkt= mittelpunkt;
    @radius = radius
    # die Füllfarbe und Linienfarbe ist rot
    @farbe = farbe
    # zu Beginn sind Kreise nicht sichtbar
    @sichtbar = false
  end

  def position
    return @mittelpunkt
  end

  def mittelpunkt
    return @mittelpunkt
  end

  def radius
    return @radius
  end

  def farbe
    return @farbe
  end

  def sichtbar?()
    return @sichtbar
  end

  def sichtbar_machen()
    @sichtbar = true
    zeichnen()
  end

  def unsichtbar_machen()
    loeschen()
    @sichtbar = false
  end

  def nach_unten_bewegen()
    # Mittelpunkt um 10 Pixel nach unten verschieben
    bewegen_um_punkt(Point.new(0,10))
  end

  def horizontal_bewegen(anzahl)
    # Mittelpukt um anzahl Pixel horizontal verschieben
    bewegen_um_punkt(Point.new(anzahl,0))
  end

  def vertikal_bewegen(anzahl)
    bewegen_um_punkt(Point.new(0,anzahl))
  end

  # Bewege einen Kreis langsam vertikal um
  # entfernung Bildpunkte
  def langsam_vertikal_bewegen(entfernung)
    absolute_entfernung = entfernung
    if( sichtbar?)
      delta  = 1
      if entfernung < 0
        delta = -1
        absolute_entfernung = - entfernung
      end
      x_delta = 0
      y_delta = delta
      Leinwand.gib_einzige_instanz().
      bewege(self,absolute_entfernung,x_delta,y_delta)
    end
    @mittelpunkt = @mittelpunkt + Point.new(0,entfernung)
  end

  def langsam_horizontal_bewegen(entfernung)
    absolute_entfernung = entfernung
    if( sichtbar?)
      delta  = 1
      if entfernung < 0
        delta = -1
        absolute_entfernung = - entfernung
      end
      x_delta = delta
      y_delta = 0
      Leinwand.gib_einzige_instanz().
      bewege(self,absolute_entfernung,x_delta,y_delta)
    end
    @mittelpunkt = @mittelpunkt + Point.new(entfernung, 0)
  end

  def bewegen(wiederholungen, x_delta, y_delta, wiederholungen_nach, starten_nach)
    if( sichtbar?)
      Leinwand.gib_einzige_instanz().bewege(self, wiederholungen, x_delta, y_delta, wiederholungen_nach, starten_nach)
    end
    @mittelpunkt = @mittelpunkt + (Point.new(x_delta, y_delta) * wiederholungen)
  end

  def farbe_aendern(neue_farbe)
    if  neue_farbe == "gruen"
      @farbe = :green
    end
    if neue_farbe == "rot"
      @farbe = :red
    end
    if  neue_farbe == "blau"
      @farbe = :blue
    end
    if neue_farbe == "gelb"
      @farbe = :yellow
    end
    if neue_farbe == "weiss"
      @farbe = :white
    end
    if neue_farbe == "schwarz"
      @farbe = :black
    end
    if (sichtbar?)
      Leinwand.gib_einzige_instanz().farbe_aendern(self)
    end
  end

  def groesse_aendern(neuer_radius)
    loeschen()
    @radius = neuer_radius
    zeichnen()
  end

  # Methode für das Verschieben eines Kreis
  def bewegen_um_punkt(punkt)
    @mittelpunkt = @mittelpunkt + punkt
    if (sichtbar?)
      Leinwand.gib_einzige_instanz().verschiebe(self,punkt.x,punkt.y)
    end
  end

  # Ein Kreis wird nur gezeichnet, wenn die Instanz sichtbar ist
  def zeichnen()
    if sichtbar?()
      Leinwand.gib_einzige_instanz().zeichne_kreis(self)
    end
  end

  # Nur sichtbare Kreise werden auf der Leinwand gelöscht
  def loeschen()
    if sichtbar?
      Leinwand.gib_einzige_instanz().loesche(self)
    end
  end

end