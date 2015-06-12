require "tk"
require "Turtle"
require "Point"

class RekursiverBaum

  # Konstanten für die unterschiedlichen Baumtypen
  BAUM1 = 1
  BAUM2 = 2
  BAUM3 = 3
  BAUM1_LAENGE = 100
  BAUM2_LAENGE = 100
  BAUM3_LAENGE = 50
  BAUM1_BREITE = 10
  BAUM2_BREITE = BAUM1_BREITE
  BAUM3_BREITE = BAUM1_BREITE
  BAUM1_WINKEL = 24.8
  BAUM2_WINKEL = 25.7
  BAUM3_WINKEL = 22.5
  def initialize()
    @factor = 2.0 # Faktor, um den in jedem Schritt die Länge der Strecke gekürzt wird.
  end

  def zeichnen(typ,wiederholungen,x,y)
    @turtle = Turtle.new(x,y,90)  # Zeichenwerkzeug
    case typ
    when BAUM1
      baum1(wiederholungen, BAUM1_WINKEL,BAUM1_LAENGE, BAUM1_BREITE)
    when BAUM2
      baum2(wiederholungen, BAUM2_WINKEL, BAUM2_LAENGE, BAUM2_BREITE)
    when BAUM3
      baum3(wiederholungen, BAUM3_WINKEL, BAUM3_LAENGE, BAUM3_BREITE)
    else
      puts "Typ nicht bekannt"
    end
  end

  def loeschen()
    @turtle.loeschen()
  end

  # P =  {X -> F[+X]F[-X]+X}
  def baum1(n,winkel,laenge,breite)
    if n == 0
      @turtle.go_ahead(laenge,breite)
      return
    end
    @turtle.go_ahead(laenge,breite)                        # F
    @turtle.remember                                       # [
    @turtle.turn_left(winkel)                              # +
    baum1(n-1,winkel,laenge/@factor,breite/@factor)        # X
    @turtle.restore                                        # ]
    @turtle.go_ahead(laenge,breite)                        # F
    @turtle.remember                                       # [
    @turtle.turn_right(winkel)                             # -
    baum1(n-1,winkel,laenge/@factor,breite/@factor)        # X
    @turtle.restore                                        # ]
    @turtle.turn_left(winkel)                              # +
    baum1(n-1,winkel,laenge/@factor,breite/@factor)        # X
  end

  # P = {X-> F[+X][-X]FX}
  def baum2(n,winkel,laenge, breite)
    if n == 0
      @turtle.go_ahead(laenge,breite)
      return
    end
    @turtle.go_ahead(laenge,breite)                        # F
    @turtle.remember                                       # [
    @turtle.turn_left(winkel)                              # +
    baum2(n-1,winkel,laenge/@factor,breite/@factor)        # X
    @turtle.restore                                        # ]
    @turtle.remember                                       # [
    @turtle.turn_right(winkel + 10)                        # - # Anderer Winkel
    baum2(n-1,winkel,laenge/@factor,breite/@factor)        # X
    @turtle.restore                                        # ]
    @turtle.go_ahead(laenge,breite)                        # F
    baum2(n-1,winkel,laenge/@factor,breite/@factor)        # X
  end

  # P = {X -> F-[[X]+X]+F+[+FX]-X}
  def baum3(n,winkel,laenge,breite)
    if n == 0
      @turtle.go_ahead(laenge,breite)
      return
    end
    @turtle.go_ahead(laenge,breite)                        # F
    @turtle.turn_right(winkel)                             # -
    @turtle.remember                                       # [
    @turtle.remember                                       # [
    baum3(n-1,winkel,laenge/@factor,breite/@factor)        # X
    @turtle.restore                                        # ]
    @turtle.turn_left(winkel)                              # +
    baum3(n-1,winkel,laenge/@factor,breite/@factor)        # X
    @turtle.restore                                        # ]
    @turtle.turn_left(winkel)                              # +
    @turtle.go_ahead(laenge,breite)                        # F
    @turtle.turn_left(winkel)                              # +
    @turtle.remember                                       # [
    @turtle.turn_left(winkel)                              # +
    @turtle.go_ahead(laenge,breite)                        # F
    baum3(n-1,winkel,laenge/@factor,breite/@factor)        # X
    @turtle.restore                                        # ]
    @turtle.turn_right(winkel)                             # -
    baum3(n-1,winkel,laenge/@factor,breite/@factor)        # X
  end

end