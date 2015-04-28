require "Zelle"
require "Point"

class Life

  # TODO
  def initialize(n,muster_index)

  end

  # TODO
  def naechste_generation()
  end
  
  #TODO
  def lebende_nachbar_zellen(i,j)
  end

  #TODO
  def unsichtbar_machen()
  end

  #TODO
  def sichtbar_machen()
  end
  
  #TODO
  def zuruecksetzen()
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