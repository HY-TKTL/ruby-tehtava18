require 'date'
class Lukija
  attr_accessor :minDate, :maxDate, :yhteensa

  def initialize(fileName)
    @minDate = Date.new(10000,1,1)
    @maxDate = Date.new(0,1,1)
    @yhteensa = 0
    @count = 0
    puts minDate
    puts maxDate
    File.foreach(fileName) do |line|
      split = line.split(" ")
      date = Date.strptime(split[0], "%d.%m.%y")
      hours = split[1].chomp('h')
      #puts "Date #{date} hours #{hours}"
      @yhteensa += Integer(hours)
      @minDate = date if date < @minDate
      @maxDate = date if date > @maxDate
      @count += 1
    end
    @keskiArvo = @yhteensa / @count
    @minDate = omaParse(@minDate)
    @maxDate = omaParse(@maxDate)
  end

  def omaParse(date)
    date.strftime("%d.%m.%y")
  end

  def tilasto
    {:yhteensa => @yhteensa, :alku => @minDate, :loppu => @maxDate, :keskiArvo => @keskiArvo}
  end
end

l = Lukija.new("testi.txt")
puts l.tilasto