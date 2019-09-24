require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


require 'pry'
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

fr1 = FundingRound.new("su1", "vc1", "seed", 80)

vc1 = VentureCapitalist.new("bigV1", 1600)
vc2 = VentureCapitalist.new("bigV2", 2000)

su1 = Startup.new("Flatiron", "Avi", "Education")
su2 = Startup.new("FI Clothes", "Avi", "Clothes")

# Startup.domains
# su1.domains
# su2.domains

# Startup.find_by_founder("Avi")

su1.sign_contract(vc2, "equipment funds", 100)
puts su1.num_funding_rounds.count



# binding.pry
# 0 #leave this here to ensure binding.pry isn't the last line