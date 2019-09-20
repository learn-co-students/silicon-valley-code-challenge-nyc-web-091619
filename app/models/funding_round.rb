require 'pry'

class FundingRound
    attr_reader :startup, :venture_capitalist, :investment
    attr_accessor :type

    @@all = []

    def self.all
        @@all
    end

    def initialize(strtup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        investment > 0 ? @investment = investment : @investment = 0
        @@all << self
    end

end
 

r1 = FundingRound.new()

binding.pry
0