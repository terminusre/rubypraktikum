require 'tk'
require 'Einstellungen'

class Leinwand < TkCanvas

  private_class_method :new
  @@einzige_instanz = nil
  def Leinwand.gib_einzige_instanz(parent=nil,*args,&block)
    if @@einzige_instanz == nil
      @@einzige_instanz = new(parent,*args,&block)
    end
    return @@einzige_instanz
  end

  attr_reader :figuren_graphiken

  def initialize(parent,*args,&block)
    super
    
    self[:scrollregion] = '0 0 1000 1000'
    @h = TkScrollbar.new(parent) {orient 'horizontal'}
    @v = TkScrollbar.new(parent) {orient 'vertical'}
    self.xscrollbar(@h)
    self.yscrollbar(@v)
    
    self.grid :sticky => 'nwes', :column => 0, :row => 0
    @h.grid :sticky => 'we', :column => 2, :row => 2
    @v.grid :sticky => 'ns', :column => 3, :row => 1
   
    @figuren_graphiken = {}
    @hintergrund_farbe = $BACKGROUND_COLOR
    @warte_bis = 0
  end

  def radieren()
    self.delete('all')
    @figuren_graphiken= {}
  end

  def zeichne_kreis(kreis)
    mittelpunkt = kreis.mittelpunkt
    radius = kreis.radius
    x1 = mittelpunkt.x-radius
    y1 = mittelpunkt.y-radius
    x2 = mittelpunkt.x + radius
    y2 = mittelpunkt.y + radius
    alte_figur_loeschen(kreis)
    kreis_graphik = TkcOval.new(self, x1,y1,x2,y2, :fill => kreis.farbe, :outline => kreis.farbe)
    @figuren_graphiken[kreis] = kreis_graphik
    erneut_zeichnen()
  end

  def zeichne_linie(linie)
    p1 = linie.punkt1()
    p2 = linie.punkt2()
    x1 = p1.x()
    y1 = p1.y()
    x2 = p2.x()
    y2 = p2.y()
    linien_graphik = TkcLine.new( self, x1,y1, x2,y2, :fill => linie.farbe(), :width => linie.breite())
    @figuren_graphiken[linie] = linien_graphik
    #erneut_zeichnen()
  end

  def alte_figur_loeschen(figur)
    figur_graphik = @figuren_graphiken.delete(figur)
    if( figur_graphik)
      self.delete(figur_graphik.id)
    end
  end

  def zeichne_rechteck(rechteck)
    obere_linke_ecke = rechteck.obere_linke_ecke
    x1 = obere_linke_ecke.x
    y1 = obere_linke_ecke.y
    x2 = x1 + rechteck.breite
    y2 = y1 + rechteck.hoehe
    alte_figur_loeschen(rechteck)
    if rechteck.fill
      rechteck_graphik =TkcRectangle.new(self, x1,y1,x2,y2,:fill => rechteck.farbe, :outline => rechteck.farbe)
    else
      rechteck_graphik =TkcRectangle.new(self, x1,y1,x2,y2,:outline => rechteck.farbe)
    end
    @figuren_graphiken[rechteck] = rechteck_graphik
    erneut_zeichnen()
  end

  def zeichne_dreieck(dreieck)
    x1 = dreieck.spitze.x
    y1 = dreieck.spitze.y
    x2 = x1 - dreieck.breite/2
    x3 = x1 + dreieck.breite/2
    y2 = y1 + dreieck.hoehe
    y3 = y2
    alte_figur_loeschen(dreieck)
    if dreieck.fill
      dreieck_graphik = TkcPolygon.new(self,x1,y1,x2,y2,x3,y3, :fill => dreieck.farbe(), :outline => dreieck.farbe())
    else
      dreieck_graphik = TkcPolygon.new(self,x1,y1,x2,y2,x3,y3, :fill => :white, :outline => dreieck.farbe())
    end
    @figuren_graphiken[dreieck] = dreieck_graphik
    erneut_zeichnen()
  end

  def loesche(figur)
    figur_graphik = @figuren_graphiken.delete(figur)
    if figur_graphik
      self.delete(figur_graphik.id)
    end
    erneut_zeichnen()
  end

  def alles_loeschen()
    kopie = @figuren_graphiken.clone()
    kopie.each_key {|figur|
      figur.unsichtbar_machen()
    }
  end

  def farbe_aendern(figur)
    if @figuren_graphiken.include?(figur)
      figur_graphik = @figuren_graphiken[figur]
      if !(figur_graphik.is_a?(TkcLine))
        figur_graphik[:outline] = figur.farbe
      end
      if figur.fill
        figur_graphik[:fill] = figur.farbe
      end
    end
  end

  def verschiebe(figur,x,y)
    if (@figuren_graphiken.include?(figur))
      figur_graphik = @figuren_graphiken[figur]
      self.move(figur_graphik.id,x,y)
    end
  end

  # Bewegt eine geometrische Figur langsam vertikal
  #
  # alle_n_milli_sekunden wird um verschiebung_y verschoben.
  # Die Standardeinstellung für alle_n_milli_sekunden ist 100
  # wiederholung gibt an, wie oft verschoben wird.
  # Die Bewegung starten nach starten_nach_millis Millisekunden
  # Die Standardeinstellung für starten_nach_millis ist 0. d.h.: Die Bewegung startet
  # sofort beim Aufruf der Methoden

  def bewege_langsam_vertikal(figur,wiederholung,verschiebung_y, alle_n_milli_sekunden=100,starten_nach_millis=0)
    bewege(figur,wiederholung,0,verschiebung_y,alle_n_milli_sekunden,starten_nach_millis)
  end

  # Bewegt eine geometrische Figur langsam
  #
  # Die Figur wird um 'verschiebung_x', 'verschiebung_y'  'wiederholungen' mal
  # verschoben. Die Wiederholungsrate wird mit 'wiederholen_nach' angegeben.
  # Die Standardeinstellung für 'wiederholen_nach' ist 100 ms
  # 'wiederholungen' gibt an, wie oft verschoben wird.
  # Die Verschiebung startet nach 'starten_nach' Millisekunden
  # Die Standardeinstellung für 'starten_nach' ist 0, d.h.: die Bewegung startet
  # sofort beim Aufruf der Methode

  def bewege(figur,wiederholungen,verschiebung_x,verschiebung_y,
    wiederholen_nach=100,starten_nach=0)
    if (@figuren_graphiken.include?(figur))
      TkAfter.new(wiederholen_nach,wiederholungen,
      proc {
        verschiebe(figur,verschiebung_x,verschiebung_y)
      } ).start(starten_nach)
    end
  end

  def erneut_zeichnen()
    @figuren_graphiken.each_key { |figur| farbe_aendern(figur)  }
  end

end