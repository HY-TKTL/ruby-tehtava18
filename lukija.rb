require 'date'

class Lukija

    def initialize(tiedostonimi)
        @tiedot = {}
        @tiedostonimi = tiedostonimi
    end



    def tilasto()
        #jos on tehty, ei tehdä uudelleen
        if @tiedot[:alku]
            return @tiedot
        end

        tuntisumma = 0

        tiedosto = File.new(@tiedostonimi, "r")
        rivit = tiedosto.read.split("\n")
        tiedosto.close


        rivit.each do |rivi|

            pvm_s = rivi.split[0].strip
            paiva = Date.strptime(pvm_s, '%d.%m.%y')
            if (not @tiedot[:alku]) || paiva < @tiedot[:alku]
                @tiedot[:alku] = paiva
            end
            if (not @tiedot[:loppu]) || paiva > @tiedot[:loppu]
                @tiedot[:loppu] = paiva
            end

            kesto_s = rivi.split[1].strip
            kesto_s.chop!
            kesto = Integer(kesto_s)
            tuntisumma += kesto

        end
        @tiedot[:yhteensa] = tuntisumma
        @tiedot[:keskiarvo] = 1.0*tuntisumma / rivit.count
        @tiedot[:alku] = @tiedot[:alku].to_s 
        @tiedot[:loppu] = @tiedot[:loppu].to_s

        @tiedot
    end

end