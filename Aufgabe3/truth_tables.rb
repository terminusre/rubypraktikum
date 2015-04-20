def truth_tables
  def erzeuge_tabelle(operator, werte)
    tabelle = []
    tabelle.push('A B ' + operator)
    tabelle.push('--------')
    tabelle.push('0 0  ' + werte[0].to_s + '  ')
    tabelle.push('0 1  ' + werte[1].to_s + '  ')
    tabelle.push('1 0  ' + werte[2].to_s + '  ')
    tabelle.push('1 1  ' + werte[3].to_s + '  ')
    return tabelle
  end

  tabellen = [
    erzeuge_tabelle('AND ', [0, 0, 0, 1]),
    erzeuge_tabelle(' OR ', [0, 1, 1, 1]),
    erzeuge_tabelle('NOR ', [1, 0, 0, 0]),
    erzeuge_tabelle('NAND', [1, 1, 1, 0])
  ]

  n = tabellen[0].length * 2
  i = 0
  j = 0
  while i < n
    while j < 2
      if j == 0 && i < n / 2
        print tabellen[0][i % tabellen[0].length] + '|'
      elsif j == 1 && i > n / 2
        print tabellen[1][i % tabellen[0].length]
      elsif j == 0 / 2 && i > n / 2
        print tabellen[2][i % tabellen[0].length] + '|'
      else
        print tabellen[3][i % tabellen[0].length]
      end

      j = j + 1
    end
    puts ''
    j = 0
    i= i + 1
  end

end

truth_tables