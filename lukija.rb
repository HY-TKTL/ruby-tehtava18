require 'date'

class Lukija
  def initialize tiedostoNimi
    @tiedostoNimi = tiedostoNimi
  end

  def tilasto
    tilasto = {}
    summa = 0.0
    lkm = 0
    alkupvm = Date.new(9999,12,31)
    loppupvm = Date.new(0001,1,1)
    IO.foreach("#{@tiedostoNimi}") do |x|
      summa += x.split[1].delete('h').to_i
      lkm += 1
      date = Date.strptime(x.split[0], "%d.%m.%y")
      if date < alkupvm
        alkupvm = date
      end

      if date > loppupvm
        loppupvm = date
      end
    end
    tilasto[:yhteensa] = summa
    tilasto[:keskiarvo] = summa / lkm
    tilasto[:alku] = alkupvm.to_s
    tilasto[:loppu] = loppupvm.to_s
    tilasto
  end

end

vast = Lukija.new('test_files/testi1.txt').tilasto