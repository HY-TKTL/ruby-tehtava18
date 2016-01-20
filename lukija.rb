require 'date' # Käsitellään päivämääriä

class Lukija
  def initialize(file)
    @file = file
  end

  def tilasto()
    sum, amount = 0, 0
    days = []

    File.readlines(@file).each do |line|
      splitted = line.split
      days.push(Date.strptime(splitted[0], '%d.%m.%y').to_s)
      sum += splitted[1].chop.to_i
      amount += 1
    end

    days.sort! # Järjestä, että saadaan viimeinen ja ensimmäinen päivä

    return {
      :yhteensa => sum,
      :keskiarvo => sum.to_f / amount,
      :alku => Date.parse(days.first).to_s,
      :loppu => Date.parse(days.last).to_s
    }
  end
end
