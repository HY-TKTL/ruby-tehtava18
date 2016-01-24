class Lukija

	def initialize fileName
		@fileName = fileName
	end

	def tilasto
		require 'date'

		yhteensa = 0
		kirjauksia = 0
		alku = nil
		loppu = nil

		File.open(@fileName) do |f|
			f.each_line do |line|
				lineData = line.split " "
				dateData = lineData.first.split "."
				date = Date.new ("20" + dateData[2]).to_i, dateData[1].to_i, dateData[0].to_i

				if alku == nil || date < alku
					alku = date
				end

				if loppu == nil || date > loppu
					loppu = date
				end

				yhteensa += lineData[1].to_i
				kirjauksia += 1
			end
		end

		if kirjauksia == 0
			keskiarvo = 0.0
		else
			keskiarvo = yhteensa.to_f / kirjauksia.to_f
		end

		{:yhteensa => yhteensa, :keskiarvo => keskiarvo, :alku => alku.to_s, :loppu => loppu.to_s}
	end

end