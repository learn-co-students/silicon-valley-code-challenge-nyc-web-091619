require_relative '../config/environment.rb'
require 'pry'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


#Venture capitalists initialize(name, total_worth)
hal = VentureCapitalist.new("Haliburton", 1800000)
tres_commas_club = VentureCapitalist.new("Tres commas club", 1900000000)
possum = VentureCapitalist.new("Peter", 800000)
kite = VentureCapitalist.new("Katey", 700000)

#Startups initialize(name, founder, domain)
airplane = Startup.new("Flying High", "Wright Broski", "aviation")
cake = Startup.new("Sweet Tres Leches Cake", "Nestlee Carnation", "pastry")
fur = Startup.new("Great fur", "Chanel Jones", "textile")
soaring = Startup.new("Soaring Fun", "Thomas Edison", "aviation")

#Venture Capitalist Methods Testing
hal.offer_contract(airplane, "seed", 50000)
hal.offer_contract(cake, "equipment", 95000)
hal.offer_contract(soaring, "seed", 390000)
hal.funding_rounds
hal.portfolio
hal.biggest_investment
hal.invested("aviation")

#Startups Methods Testing
fur
fur.pivot("BBQ", "SlimTims")
Startup.find_by_founder("Nestlee Carnation")
Startup.domains
fur.sign_contract(possum, "starter", 700000)
fur.my_fundings
airplane.my_fundings
cake.sign_contract(tres_commas_club, "subscription", 9800000)
cake.my_fundings.count
cake.total_funds
airplane.investors
cake.investors
p cake.big_investors





#binding.pry
0 #leave this here to ensure binding.pry isn't the last line