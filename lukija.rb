require 'date'
class Lukija
    def initialize(fn)
        f = File.new(fn)
        @pvm = []
        @tunnit = 0.0
        f.each{|line| 
            @pvm<<line.split(' ').first 
            @tunnit += line.split(' ').last.to_i
        }
        f.close
    end

    def tilasto
        {yhteensa: @tunnit,
         keskiarvo: @tunnit/@pvm.length,
         alku: @pvm.map{|d| Date.strptime(d, '%d.%m.%y')}.sort.first.to_s,
         loppu: @pvm.map{|d| Date.strptime(d, '%d.%m.%y')}.sort.last.to_s}
    end
end
