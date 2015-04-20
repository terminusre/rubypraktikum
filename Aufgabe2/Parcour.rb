require 'tk'
require 'Rechteck'
require 'Kreis'
require 'Dreieck'
require 'Einstellungen'
require 'Kreatur'

class Parcour
  def initialize()
    @kreaturen = []
    @kreaturen.push(Kreatur.new(40, 40))
    @kreaturen.push(Kreatur.new(350, 200))

    @kreaturen.each do |kreatur|
      kreatur.sichtbar_machen
    end

    #animieren
    
    kreatur_hinzufuegen
    animieren2
  end

  def animieren
    kreatur0_zeit = @kreaturen[0].bewegen(2, 0, 200, 20, 100)
    kreatur0_zeit = @kreaturen[0].nach_links_springen(kreatur0_zeit)
    kreatur0_zeit = @kreaturen[0].bewegen(0, 2, 150, 15, kreatur0_zeit)
    kreatur0_zeit = @kreaturen[0].huepfen(kreatur0_zeit)
    kreatur0_zeit = @kreaturen[0].bewegen(-1, -1, 100, 10, kreatur0_zeit)
    kreatur0_zeit = @kreaturen[0].nach_rechts_springen(kreatur0_zeit)
    kreatur0_zeit = @kreaturen[0].bewegen(-2, -1, 180, 20, kreatur0_zeit)
    kreatur0_zeit = @kreaturen[0].nach_rechts_springen(kreatur0_zeit)
    kreatur0_zeit = @kreaturen[0].huepfen(kreatur0_zeit)
    kreatur0_zeit = @kreaturen[0].bewegen(2, 1, 200, 10, kreatur0_zeit)

    kreatur1_zeit = @kreaturen[1].nach_links_springen(50)
    kreatur1_zeit = @kreaturen[1].nach_links_springen(kreatur1_zeit)
    kreatur1_zeit = @kreaturen[1].nach_links_springen(kreatur1_zeit)
    kreatur1_zeit = @kreaturen[1].bewegen(2, -1, 200, 10, kreatur1_zeit)
    kreatur1_zeit = @kreaturen[1].bewegen(1, 1, 100, 20, kreatur1_zeit)
    kreatur1_zeit = @kreaturen[1].nach_links_springen(kreatur1_zeit)
    kreatur1_zeit = @kreaturen[1].bewegen(-1, 0, 200, 20, kreatur1_zeit)
    kreatur1_zeit = @kreaturen[1].huepfen(kreatur1_zeit)
    kreatur1_zeit = @kreaturen[1].bewegen(1, 1, 150, 20, kreatur1_zeit)
    kreatur1_zeit = @kreaturen[1].bewegen(-1, 0, 150, 20, kreatur1_zeit)

  end

  def animieren2(bewegungsdauer = 5000)
    @kreaturen.each do |kreatur|
      gelaufene_zeit = 0
      while gelaufene_zeit < bewegungsdauer
        case rand(10)
        when 0..4 then
          x_delta = kreatur.position.x < 150 ? rand(1) + 1 : (kreatur.position.x > 800 ? -(rand(1) + 1) : rand(5) - 2)
          y_delta = kreatur.position.y < 150 ? rand(1) + 1 : (kreatur.position.y > 600 ? -(rand(1) + 1) : rand(5) - 2)
          gelaufene_zeit = gelaufene_zeit + kreatur.laufen(x_delta, y_delta, rand(200))
        when 5..7 then
          gelaufene_zeit = gelaufene_zeit + kreatur.abspringen
        when 8..9 then
          gelaufene_zeit = gelaufene_zeit + kreatur.huepfer
        end
      end
    end
  end

  def kreatur_hinzufuegen(x_position = rand(600) + 100, y_position = rand(400) + 100)
    @kreaturen.push(Kreatur.new(x_position, y_position))
    @kreaturen[@kreaturen.length - 1].sichtbar_machen
  end

end

