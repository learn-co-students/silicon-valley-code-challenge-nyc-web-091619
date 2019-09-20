require_relative "./models/startup"
require_relative "./models/venture_capitalist"
require_relative "./models/funding_round"

require "pry"

s1 = Startup.new("hello", "boopererg", ".com")
s2 = Startup.new("jupytr", "rax max", ".edu")
s3 = Startup.new("mother's milk", "immortan joe", ".org")
s4 = Startup.new("thunderdome", "tina turner", ".gov")

v1 = VentureCapitalist.new("Jim", 10000)
v2 = VentureCapitalist.new("Max", 1398412304)
v3 = VentureCapitalist.new("Larry", 647891)
v4 = VentureCapitalist.new("Samantha", 8737399287)

f1 = FundingRound.new(s1, v1, "seed", (rand()*v1.total_worth).round(2))
f2 = FundingRound.new(s2, v2, "series a", (rand()*v2.total_worth).round(2))
f3 = FundingRound.new(s3, v3, "pre-seed", (rand()*v3.total_worth).round(2))
f4 = FundingRound.new(s4, v3, "angel", (rand()*v4.total_worth).round(2))



# binding.pry