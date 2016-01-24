RSpec.describe 'luokka Lukija' do
require 'date'
  it "on määritelty oikeassa tiedostossa" do
    expect(File.exists? './lukija.rb' ).to be true
    require './lukija.rb'
    Lukija
  end

  it "konstruktoria voidaan kutsua jos tiedosto olemassa" do
    require './lukija.rb'
    Lukija.new 'test_files/testi1.txt'
  end

  it "metodi tilasto toimii oikein tiedostolla test_files/testi1.txt" do
    require './lukija.rb'
    vast = Lukija.new('test_files/testi1.txt').tilasto
    expect(vast[:yhteensa]).to eq 10
    expect(vast[:keskiarvo]).to eq 5
    expect(vast[:alku]).to eq Date.new(2015,9,2).to_s
    expect(vast[:loppu]).to eq Date.new(2015,9,10).to_s
  end

  it "metodi tilasto toimii oikein tiedostolla test_files/testi2.txt" do
    require './lukija.rb'
    vast = Lukija.new('test_files/testi2.txt').tilasto
    expect(vast[:yhteensa]).to eq 34
    expect(vast[:keskiarvo]).to eq 4.25
    expect(vast[:alku]).to eq Date.new(2015,9,2).to_s
    expect(vast[:loppu]).to eq Date.new(2015,9,11).to_s
  end

  it "metodi tilasto toimii oikein tiedostolla test_files/testi3.txt" do
    require './lukija.rb'
    vast = Lukija.new('test_files/testi2.txt').tilasto
    expect(vast[:yhteensa]).to eq 34
    expect(vast[:keskiarvo]).to eq 4.25
    expect(vast[:alku]).to eq Date.new(2015,9,2).to_s
    expect(vast[:loppu]).to eq Date.new(2015,9,11).to_s
  end

  it "metodi tilasto toimii oikein tiedostolla test_files/testi3.txt" do
    require './lukija.rb'
    vast = Lukija.new('test_files/testi3.txt').tilasto
    expect(vast[:yhteensa]).to eq 63
    expect(vast[:keskiarvo]).to eq 5.25
    expect(vast[:alku]).to eq Date.new(2014,4,7).to_s
    expect(vast[:loppu]).to eq Date.new(2016,1,1).to_s
  end

  before :all do
    if Dir.exist? 'test_files'
      Dir.new('test_files').each do |f|
        file = "test_files/#{f}"
        File.delete(file) unless File.directory? file
      end
      Dir.rmdir 'test_files'
    end

    Dir.mkdir 'test_files'

    testit = []

    testit <<
<<HEREDOC
2.9.15 8h
10.9.15 2h
HEREDOC

    testit <<
<<HEREDOC
2.9.15 7h
3.9.15 3h
4.9.15 8h
5.9.15 4h
6.9.15 5h
7.9.15 4h
8.9.15 1h
11.9.15 2h
HEREDOC

    testit <<
<<HEREDOC
12.10.15 5h
7.9.15 4h
6.9.15 8h
5.9.15 2h
14.6.15 5h
7.9.15 6h
8.9.15 1h
11.9.15 8h
7.4.14 5h
1.1.16 3h
7.9.15 4h
15.11.15 12h
HEREDOC

    testit.size.times do |i|
      File.open("test_files/testi#{i+1}.txt", 'w') do |f|
        f.write(testit[i])
      end
    end

  end
end
