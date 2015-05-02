require "Zelle"
require "Point"

class Life
  def initialize(n, muster_index)
    muster = [
      [[0, 1], [1, 1]],
      [[1, 2], [2, 3], [3, 1], [3, 2], [3, 3]],
      [[0, 0], [5, 5]]
    ]
    @muster = muster[muster_index]

    # @zellen[zeile][spalte] :
    #
    #           7
    #   +------------>
    #   |
    # 1 |       X
    #   |        \
    #   |         @zellen[1][7]
    #   V

    @zellen = []
    for zeile in 0 .. n - 1
      @zellen.push([])
      for spalte in 0 .. n - 1
        @zellen[zeile].push(Zelle.new(Point.new(10, 10), zeile, spalte, 20, @muster.include?([zeile, spalte]) ? true : false))
      end
    end

    sichtbar_machen
  end

  # TODO
  def naechste_generation
    zellen_der_naechsten_generation = @zellen.clone
    n = @zellen.length

    for zeile in 0 .. n - 1
      for spalte in 0 .. n - 1
        lebendige_nachbarn = lebende_nachbar_zellen(zeile, spalte)
        puts zeile.to_s + ' / ' + spalte.to_s + ' -> ' + lebendige_nachbarn.to_s
        if lebendige_nachbarn > 2
          zellen_der_naechsten_generation[zeile][spalte].leben
        elsif lebendige_nachbarn < 2
          zellen_der_naechsten_generation[zeile][spalte].sterben
        end
      end
    end

    @zellen = zellen_der_naechsten_generation
    sichtbar_machen
  end

  def lebende_nachbar_zellen(i, j)
    lebendige_nachbarn = - 1 # Da die Methode die Zelle selbst mitzaehlt, wird mit -1 initzialisiert
    n = @zellen.length

    for zeile in -1 .. 1
      for spalte in -1 .. 1
        if @zellen[(i + zeile + n) % n][(j + spalte + n) % n].lebendig?
          lebendige_nachbarn += 1
        end
      end
    end

    return lebendige_nachbarn
  end

  def unsichtbar_machen
    @zellen.each do |zellenspalte|
      zellenspalte.each do |zelle|
        zelle.unsichtbar_machen
      end
    end
  end

  def sichtbar_machen
    @zellen.each do |zellenspalte|
      zellenspalte.each do |zelle|
        zelle.sichtbar_machen
      end
    end
  end

  def zuruecksetzen()
    @zellen.each do |zellenzeile|
      zellenzeile.each do |zelle|
        zelle.sterben
      end
    end

    @muster.each do |lebendige_zelle|
      @zellen[lebendige_zelle[0]][lebendige_zelle[1]].leben
    end

    sichtbar_machen
  end

  #
  # Vorgegebene Methode der Klasse Life
  #

  # Simuliert die Entwicklung der Generationen des Game Of Life für n - Wiederholungen
  #
  # Dazu wird alle 10 ms die Folgegeneration mit Hilfe der Methode
  # naechste_generation berechnet und dargestellt
  #
  def simuliere(schritte)
    TkTimer.new(10,schritte, proc{
      naechste_generation()
    }).start(0, proc{})
  end

end