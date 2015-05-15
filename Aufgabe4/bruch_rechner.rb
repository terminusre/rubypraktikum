require 'MyRational'

def get_number(string)
  begin
    return Integer(string)
  rescue
    return false
  end
end

def get_MyRational(string)
  index_bruchstrich = string.index('/') #.split
  if index_bruchstrich != nil
    zaehler = get_number(string[0 .. index_bruchstrich - 1])
    nenner = get_number(string[index_bruchstrich + 1 .. - 1])
    if zaehler && nenner
      return MyRational.new(zaehler, nenner)
    else
      return false
    end
  else
    zaehler = get_number(string)
    if zaehler
      return MyRational.new(zaehler, 1)
    else
      return false
    end
  end
end

x = MyRational.new(1, 1)
y = MyRational.new(1, 1)

eingabe = nil
while eingabe != 'x'
  eingabe = gets.chomp

  case eingabe
  when '+'
    x = x + y
  when '-'
    x = x - y
  when '*'
    x = x * y
  when '/'
    x = y / x
  when '--'
    x = x.neg
  when '//'
    x = x.reziprok
  when '**'
    x = x * x
  when 'x'
    break
  else
    bearbeitete_eingabe = get_MyRational(eingabe)
    if bearbeitete_eingabe
      y = x
      x = bearbeitete_eingabe
    else
      puts 'Das ist keine gueltige Eingabe!'
    end
  end

  puts 'x = ' + x.to_s
  puts 'y = ' + y.to_s

end