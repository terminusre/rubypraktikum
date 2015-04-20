require 'Point'
require 'Leinwand'
require 'Einstellungen'
require 'Kreis'
require 'Rechteck'
require 'Dreieck'

class Kreatur
  def initialize(x, y)
    mittelpunkt = Point.new(x, y)

    @koerper = []

    radius = 20
    @koerper.push(Kreis.new(mittelpunkt, radius, 'blue'))
    # Augen
    @koerper.push(Kreis.new(mittelpunkt + Point.new(-radius / 2, -radius), 5, 'yellow'))
    @koerper.push(Kreis.new(mittelpunkt + Point.new(0, -radius), 5, 'yellow'))
    # Fuesse
    @koerper.push(Dreieck.new(mittelpunkt + Point.new(radius / 2, radius / 2), 40, 15, 'black'))
    @koerper.push(Dreieck.new(mittelpunkt + Point.new(-radius / 2, radius / 2), 40, 15, 'black'))
    # Schild
    breite = 15
    hoehe = 22
    @koerper.push(Rechteck.new(mittelpunkt + Point.new(-radius - (breite / 2), -(hoehe / 2)), breite, hoehe, 'black'))
    # Schwert
    @koerper.push(Dreieck.new(mittelpunkt + Point.new(radius, -30), 60, 10, 'black'))
    # Schwerthand
    schwerthandbreite = 4
    @koerper.push(Rechteck.new(mittelpunkt + Point.new(radius - schwerthandbreite / 2, 1), schwerthandbreite, 8, 'yellow'))

    @ausrichtung = -1 # -1 = links, 1 = rechts

    @sichtbar = false

    @zeit = 0

  end

  def bewegen(x_delta, y_delta, wiederholungen, wiederholen_nach, starten_nach)
    @koerper.each do |koerperteil|
      koerperteil.bewegen(wiederholungen, x_delta, y_delta, wiederholen_nach, starten_nach)
    end
    return wiederholungen * wiederholen_nach + starten_nach
  end

  def nach_links_springen(starten_nach)
    return bewegen(-1, 1, 50, 5, bewegen(-1, -1, 50, 5, starten_nach))
  end

  def nach_rechts_springen(starten_nach)
    return bewegen(1, 1, 50, 5, bewegen(1, -1, 50, 5, starten_nach))
  end

  def huepfen(starten_nach)
    return bewegen(0, 1, 50, 5, bewegen(0, -1, 50, 5, starten_nach))
  end

  def sichtbar_machen
    if not sichtbar?()
      @koerper.each do |koerperteil|
        koerperteil.sichtbar_machen
      end
      @sichtbar = true
    end
  end

  def unsichtbar_machen
    if sichtbar?()
      @koerper.each do |koerperteil|
        koerperteil.unsichtbar_machen
      end
      @sichtbar = false
    end
  end

  def sichtbar?
    return @sichtbar
  end

  def position
    return @koerper[0].position
  end

  def laufen(x_delta, y_delta, wiederholungen, wiederholen_nach = 15, starten_nach = @zeit)
    ausrichten(x_delta, starten_nach)
    bewegen(x_delta, y_delta, wiederholungen, wiederholen_nach, starten_nach)
    gehen(starten_nach, wiederholungen * wiederholen_nach)
    haende_bewegen(starten_nach, wiederholungen * wiederholen_nach)

    @zeit = @zeit + wiederholungen * wiederholen_nach
    return wiederholungen * wiederholen_nach
  end

  def abspringen(starten_nach = @zeit)
    wiederholungen_teilbewegung = 7
    wiederholen_nach = 8
    teilbewegungsdauer = wiederholungen_teilbewegung * wiederholen_nach
    @koerper[3].bewegen(wiederholungen_teilbewegung, 0, 2, wiederholen_nach, starten_nach)
    @koerper[4].bewegen(wiederholungen_teilbewegung, 0, 2, wiederholen_nach, starten_nach)
    if @ausrichtung == -1
      nach_links_springen(starten_nach + teilbewegungsdauer / 2)
    else
      nach_rechts_springen(starten_nach + teilbewegungsdauer / 2)
    end
    @koerper[3].bewegen(wiederholungen_teilbewegung, 0, -2, wiederholen_nach, starten_nach + teilbewegungsdauer)
    @koerper[4].bewegen(wiederholungen_teilbewegung, 0, -2, wiederholen_nach, starten_nach + teilbewegungsdauer)

    @zeit = @zeit + teilbewegungsdauer / 2 + 500
    return teilbewegungsdauer / 2 + 500
  end

  def huepfer(starten_nach = @zeit)
    wiederholungen_teilbewegung = 7
    wiederholen_nach = 8
    teilbewegungsdauer = wiederholungen_teilbewegung * wiederholen_nach
    @koerper[3].bewegen(wiederholungen_teilbewegung, 0, 2, wiederholen_nach, starten_nach)
    @koerper[4].bewegen(wiederholungen_teilbewegung, 0, 2, wiederholen_nach, starten_nach)
    huepfen(starten_nach + teilbewegungsdauer / 2)
    @koerper[3].bewegen(wiederholungen_teilbewegung, 0, -2, wiederholen_nach, starten_nach + teilbewegungsdauer)
    @koerper[4].bewegen(wiederholungen_teilbewegung, 0, -2, wiederholen_nach, starten_nach + teilbewegungsdauer)

    @zeit = @zeit + teilbewegungsdauer / 2 + 500
    return teilbewegungsdauer / 2 + 500
  end

  def ausrichten(x_delta, starten_nach)

    geaendert = false

    if x_delta < 0 && @ausrichtung > 0
      @ausrichtung = -1
      geaendert = true
    elsif x_delta > 0 && @ausrichtung < 0
      @ausrichtung = 1
      geaendert = true
    end

    if geaendert
      @koerper.each do |koerperteil|
        koerperteil.bewegen(1, (@koerper[0].position.x - koerperteil.position.x) * 2, 0, 0, starten_nach)
      end
    end

  end

  def haende_bewegen(starten_nach, bewegungsdauer)
    x_delta = 1
    y_delta = 0
    wiederholen_nach = 75
    wiederholungen_teilbewegung = 3
    gesamtdauer = starten_nach + bewegungsdauer
    zyklusdauer = wiederholungen_teilbewegung * wiederholen_nach * 2
    zyklusindex = 0

    (bewegungsdauer / zyklusdauer).times do
      # Schild
      @koerper[5].bewegen(wiederholungen_teilbewegung, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[5].bewegen(wiederholungen_teilbewegung, -x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach + zyklusdauer / 2)
      # Schwert + Schwerthand
      @koerper[6].bewegen(wiederholungen_teilbewegung, -x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[6].bewegen(wiederholungen_teilbewegung, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach + zyklusdauer / 2)
      @koerper[7].bewegen(wiederholungen_teilbewegung, -x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[7].bewegen(wiederholungen_teilbewegung, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach + zyklusdauer / 2)
      zyklusindex = zyklusindex + 1
    end

    restbewegungsdauer = bewegungsdauer % zyklusdauer
    restwiederholungen = 0
    if restbewegungsdauer > zyklusdauer / 2
      restwiederholungen = (restbewegungsdauer / wiederholen_nach) - wiederholungen_teilbewegung
      @koerper[5].bewegen(wiederholungen_teilbewegung, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[5].bewegen(restwiederholungen, -x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach + zyklusdauer / 2)
      @koerper[6].bewegen(wiederholungen_teilbewegung, -x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[6].bewegen(restwiederholungen, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach + zyklusdauer / 2)
      @koerper[7].bewegen(wiederholungen_teilbewegung, -x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[7].bewegen(restwiederholungen, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach + zyklusdauer / 2)

      @koerper[5].bewegen(1, -wiederholungen_teilbewegung - restwiederholungen, y_delta, 1, gesamtdauer)
      @koerper[6].bewegen(1, wiederholungen_teilbewegung - restwiederholungen, y_delta, 1, gesamtdauer)
      @koerper[7].bewegen(1, wiederholungen_teilbewegung - restwiederholungen, y_delta, 1, gesamtdauer)
    else
      restwiederholungen = restbewegungsdauer / wiederholen_nach
      @koerper[5].bewegen(restwiederholungen, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[6].bewegen(restwiederholungen, -x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[7].bewegen(restwiederholungen, -x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)

      @koerper[5].bewegen(1, -restwiederholungen, y_delta, 1, gesamtdauer)
      @koerper[6].bewegen(1, restwiederholungen, y_delta, 1, gesamtdauer)
      @koerper[7].bewegen(1, restwiederholungen, y_delta, 1, gesamtdauer)
    end

  end

  def gehen(starten_nach, bewegungsdauer)
    x_delta = 0
    y_delta = 1
    wiederholen_nach = 10
    gesamtdauer = starten_nach + bewegungsdauer
    wiederholungen_teilbewegung = 20
    gesamtdauer = starten_nach + bewegungsdauer
    zyklusdauer = wiederholungen_teilbewegung * wiederholen_nach * 2
    zyklusindex = 0

    @koerper[3].bewegen(1, 0, -wiederholungen_teilbewegung / 2, 1, starten_nach)
    @koerper[4].bewegen(1, 0, wiederholungen_teilbewegung / 2, 1, starten_nach)

    (bewegungsdauer / zyklusdauer).times do
      @koerper[3].bewegen(wiederholungen_teilbewegung, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[3].bewegen(wiederholungen_teilbewegung, x_delta, -y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach + zyklusdauer / 2)
      @koerper[4].bewegen(wiederholungen_teilbewegung, x_delta, -y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[4].bewegen(wiederholungen_teilbewegung, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach + zyklusdauer / 2)
      zyklusindex = zyklusindex + 1
    end

    restbewegungsdauer = bewegungsdauer % zyklusdauer
    restwiederholungen = 0
    if restbewegungsdauer > zyklusdauer / 2
      restwiederholungen = (restbewegungsdauer / wiederholen_nach) - wiederholungen_teilbewegung
      @koerper[3].bewegen(wiederholungen_teilbewegung, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[3].bewegen(restwiederholungen, x_delta, -y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach + zyklusdauer / 2)
      @koerper[4].bewegen(wiederholungen_teilbewegung, x_delta, -y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[4].bewegen(restwiederholungen, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach + zyklusdauer / 2)

      @koerper[3].bewegen(1, x_delta, -(wiederholungen_teilbewegung / 2) + restwiederholungen, 1, gesamtdauer)
      @koerper[4].bewegen(1, x_delta, (wiederholungen_teilbewegung / 2) - restwiederholungen, 1, gesamtdauer)
    else
      restwiederholungen = restbewegungsdauer / wiederholen_nach
      @koerper[3].bewegen(restwiederholungen, x_delta, y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)
      @koerper[4].bewegen(restwiederholungen, x_delta, -y_delta, wiederholen_nach, zyklusindex * zyklusdauer + starten_nach)

      @koerper[3].bewegen(1, x_delta, (wiederholungen_teilbewegung / 2) - restwiederholungen, 1, gesamtdauer)
      @koerper[4].bewegen(1, x_delta, (-wiederholungen_teilbewegung / 2) + restwiederholungen, 1, gesamtdauer)
    end

  end

end