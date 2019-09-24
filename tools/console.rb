require "pry"

require_relative '../config/environment.rb'
require_relative 'Startup.rb'
require_relative 'VentureCapitalist.rb'
require_relative 'FundingRound.rb'

def reload
  load 'config/environment.rb'
end

s1 = Startup.new("a1", "elon", "space")
s2 = Startup.new("a2", "steve", "phone")
s3 = Startup.new("a3", "steve", "movies")
s4 = Startup.new("a4", "jeff", "sell shit")

v1 = VentureCapitalist.new("dog", 1000000000)
v2 = VentureCapitalist.new("cat", 25000)
v3 = VentureCapitalist.new("horse", 2000000000)
v4 = VentureCapitalist.new("cow", 1000000001)
v5 = VentureCapitalist.new("turtle", 5000000)

f1 = FundingRound.new(s1, v1, "Angle", 5000)
f2 = FundingRound.new(s1, v2, "Angle", 30000)
f3 = FundingRound.new(s2, v3, "Pre-Seed", 1999999)
f4 = FundingRound.new(s3, v3, "Seed", 29999)
f5 = FundingRound.new(s4, v5, "Series A", 399999)

f6 = s1.sign_contract(v4, "Series A", 500)

# s11=s1.pivot("cars", "a11")


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line