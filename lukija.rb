require 'date'
class Lukija
  def initialize(fileName)
    @records = load_file(fileName)
  end

  # format : 11.9.15 2h
  def load_file(fileName)
    h = Hash.new(0)
    @count = 0
    File.foreach(fileName) do |line|
      @count += 1
      splitLine = line.split(' ')
      h[Date.strptime(splitLine[0], "%d.%m.%y")] += splitLine[1].chop.to_i
    end
    h
  end

  def tilasto
    h = {}
    h[:yhteensa] = @records.values.inject(:+)
    h[:keskiarvo] = h[:yhteensa].to_f / @count
    keys = @records.keys.sort
    h[:alku] = keys.first.to_s
    h[:loppu] = keys.last.to_s
    h
  end


end
