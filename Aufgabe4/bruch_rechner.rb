require 'MyRational'

def zahl?(string)
  begin
    return Integer(string)
  rescue
    return false
  end
end

def bruch?(string)
  index_bruchstrich = string.index('/')
  if index_bruchstrich != nil
    zaehler = zahl?(string[0 .. index_bruchstrich - 1])
    nenner = zahl?(string[index_bruchstrich + 1 .. string.length - 1])
    if zaehler && nenner
      return MyRational.new(zaehler, nenner)
    else
      return false
    end
  else
    zaehler = zahl?(string)
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
    puts '*'
  when '/'
    puts '/'
  when '--'
    puts '--'
  when '//'
    puts '//'
  when '**'
    puts '**'
  when 'x'
    break
  else
    zahl = bruch?(eingabe)
    if zahl
      y = x
      x = zahl
    else
      puts 'Das ist keine gueltige Eingabe, Dummkopf!'
    end
  end

  puts 'x = ' + x.to_s
  puts 'y = ' + y.to_s
end
