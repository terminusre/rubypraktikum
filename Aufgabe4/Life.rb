require "Zelle"
require "Point"

class Life
  def initialize(n, muster_index)
    case
    when muster_index == 0 && n < 4
      raise ArgumentError, 'Um dieses Muster korrekt darzustellen, muss die Spielfeldgroesse mindestens 4*4 entsprechen!', caller
    when muster_index == 1 && n < 7
      raise ArgumentError, 'Um dieses Muster korrekt darzustellen, muss die Spielfeldgroesse mindestens 7*7 entsprechen!', caller
    when muster_index == 2 && n < 12
      raise ArgumentError, 'Um dieses Muster korrekt darzustellen, muss die Spielfeldgroesse mindestens 12*12 entsprechen!', caller
    when muster_index < 0 || muster_index > 2
      raise ArgumentError, 'Dieses Muster existiert nicht! Geben Sie einen Index zwischen 0 und 2 an!', caller
    end
    
    muster = [
      [[1, 2], [2, 3], [3, 1], [3, 2], [3, 3]], # repeats every 20 generations
      # The Lightweight Spaceship (glider 1062) from http://fano.ics.uci.edu/ca/rules/b3s23/g3.html
      [[2, 3], [2, 6], [3, 2], [4, 2], [4, 6], [5, 2], [5, 3], [5, 4], [5, 5]], # repeats every 4 generations
      # The Coe Ship (glider 9153) from http://fano.ics.uci.edu/ca/rules/b3s23/g4.html
      [[2, 3], [2, 8], [2, 9], [2, 10], [3, 2], [3, 3], [3, 4], [3, 7], [3, 10],
      [4, 2], [4, 4], [4, 5], [4, 10], [5, 3], [5, 4], [5, 5], [5, 6], [5, 10],
      [6, 3], [6, 4], [6, 10], [7, 7], [7, 10], [8, 8], [8, 9], [9, 9], [10, 8], [11, 8]], # repeats every 16 generations
      [[0, 0], [0, 5], [5, 0], [5, 5]]
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

    p = Point.new(10, 10)
    @zellen = []
    @zellen_naechste_generation = []
    for zeile in 0 .. n - 1
      @zellen.push([])
      @zellen_naechste_generation.push([])
      for spalte in 0 .. n - 1
        @zellen[zeile].push(Zelle.new(p, zeile, spalte, 20, @muster.include?([zeile, spalte]) ? true : false))
        @zellen_naechste_generation[zeile].push(Zelle.new(p, zeile, spalte, 20, false))
      end
    end

    sichtbar_machen
  end

  def naechste_generation
    n = @zellen.length

    for zeile in 0 .. n - 1
      for spalte in 0 .. n - 1
        lebendige_nachbarn = lebende_nachbar_zellen(zeile, spalte)
        # Eine tote Zelle mit 3 lebenden Nachbarn wird neu geboren.
        if !@zellen[zeile][spalte].lebendig? && lebendige_nachbarn == 3
          @zellen_naechste_generation[zeile][spalte].leben
          # Eine lebende Zelle mit weniger als zwei lebenden Nachbarn stirbt in der nachfolgenden Generation.
        elsif @zellen[zeile][spalte].lebendig? && lebendige_nachbarn < 2
          @zellen_naechste_generation[zeile][spalte].sterben
          # Eine lebende Zelle mit zwei oder drei lebenden Nachbarn Ã¼berlebt in der Nachfolgegeneration.
        elsif @zellen[zeile][spalte].lebendig? && lebendige_nachbarn < 4 && lebendige_nachbarn > 1
          @zellen_naechste_generation[zeile][spalte].leben
          # Eine lebende Zelle mit mehr als drei lebenden Nachbarn stirbt in der Nachfolgegeneration an ÃœberbevÃ¶lkerung.
        elsif @zellen[zeile][spalte].lebendig? && lebendige_nachbarn > 3
          @zellen_naechste_generation[zeile][spalte].sterben
          # Mit dem Rest passiert nichts.
        elsif @zellen[zeile][spalte].lebendig?
          @zellen_naechste_generation[zeile][spalte].leben
        else
          @zellen_naechste_generation[zeile][spalte].sterben
        end
      end
    end

    container = @zellen
    @zellen = @zellen_naechste_generation
    @zellen_naechste_generation = container
    sichtbar_machen
  end

  def lebende_nachbar_zellen(i, j)
    lebendige_nachbarn = 0
    n = @zellen.length

    for zeilendelta in -1 .. 1
      for spaltendelta in -1 .. 1
        if @zellen[(i + zeilendelta + n) % n][(j + spaltendelta + n) % n].lebendig?
          lebendige_nachbarn += 1
        end
      end
    end

    if @zellen[i][j].lebendig?
      lebendige_nachbarn -= 1
    end

    return lebendige_nachbarn
  end

  def unsichtbar_machen
    @zellen.each do |zellenzeile|
      zellenzeile.each do |zelle|
        zelle.unsichtbar_machen
      end
    end
  end

  def sichtbar_machen
    @zellen.each do |zellenzeile|
      zellenzeile.each do |zelle|
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
  #
  # Simuliert die Entwicklung der Generationen des Game Of Life fÃ¼r n - Wiederholungen
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