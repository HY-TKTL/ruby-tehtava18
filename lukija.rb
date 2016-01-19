require 'date'

class Lukija

  def initialize(file)
    @file = file
  end

  def tilasto
    tunteja = 0
    kirjauksia = 0
    paivat = []
    File.readlines(@file).each do |line|
      erotus = line.split
      paiva = erotus[0].reverse.insert(2, '02').reverse
      paivat.push(paiva)
      tunteja += erotus[1].chop.to_i
      kirjauksia += 1
    end
    ka = tunteja.to_f / kirjauksia
    paivat.sort
    ekap = Date.parse(paivat.first).to_s
    vikap = Date.parse(paivat.last).to_s
    hashi = {:yhteensa => tunteja, :keskiarvo => ka, :alku => ekap, :loppu => vikap}
    hashi
  end

end
