$CLASSES = [ :Parcour, :Kreis, :Rechteck,:Dreieck,:Kreatur ]

# NICHT BEACHTET WIRD HIER u.A.
# Vererbung von Methoden
# Methoden mit variablen Argumentlisten
# Methoden mit Parameter Defaults
# um nur einiges zu nennen

$METHOD_CONFIG = {
  :Parcour => {
  :animieren => { :label => :animieren }
  },
  :Parcour_class => {
  :new => { :label => :'new()' },
  },
  :Kreatur => {
  :sichtbar_machen => { :label => :sichtbar_machen },
  :unsichtbar_machen => { :label => :unsichtbar_machen },
    :bewegen  => {:label => :'bewegen(...)',
    :args => [
        [:'x', :Integer],
        [:'y', :Integer],
        [:'wiederholungen', :Integer],
        [:'wiederholen_nach [ms]', :Integer],
        [:'starten_nach [ms]', :Integer]] },
  :nach_links_springen => {:label => :'nach_links_springen(...)',
    :args => [
        [:'starten_nach [ms]', :Integer]] },
  :nach_rechts_springen => {:label => :'nach_rechts_springen(...)',
    :args => [
        [:'starten_nach [ms]', :Integer]] },
  :huepfen => {:label => :'huepfen(...)',
  :args => [
      [:'starten_nach [ms]', :Integer]] },
  },
  :Kreatur_class => {
    :'new' =>{ :label => :'new(...)', :args => [[:x, :Integer],[:y, :Integer]]}
  }
}