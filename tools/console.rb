require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

ice_cream = Startup.new("Belson Ice Cream", "Ice Cream", "Gavin Belson")
pied_piper = Startup.new("Pied Piper", "Compression", "Richard Hendrix")
aviato = Startup.new("Aviato", "Travel", "Erlich Bachman")
hooli = Startup.new("Hooli", "Operating Systems", "Gavin Belson")

peter_gregory = VentureCapitalist.new("Peter Gregory", 1000000000)
lauri_bream = VentureCapitalist.new("Lauri Bream", 3000000000)
ed_chan = VentureCapitalist.new("Ed Chan", 90000000)
russ_hanneman = VentureCapitalist.new("Russ Hanneman", 999000000)

series_a = FundingRound.new(pied_piper, lauri_bream, "Series A", 5000000.00)
series_b = FundingRound.new(aviato, russ_hanneman, "Pre-Seed", 250000.00)
series_c = FundingRound.new(hooli, peter_gregory, "Series C", 100000.00)
pre_seed = FundingRound.new(pied_piper, peter_gregory, "Pre-Seed", 100000.00)
pp_series_c = FundingRound.new(pied_piper, lauri_bream, "Series C", 10000000.00)
pp_series_b = FundingRound.new(pied_piper, russ_hanneman, "Series B", 5004000.00)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line