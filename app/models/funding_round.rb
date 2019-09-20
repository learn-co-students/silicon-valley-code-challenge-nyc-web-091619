class FundingRound
    attr_reader :startup, :venture_capitalist, :investment
    attr_accessor :type

    @@all = []

    def initialize(startup, type, venture_capitalist, investment)
        @startup = startup
        @type = type
        @venture_capitalist = venture_capitalist
        investment >=0? @investment = investment : @investment = 0.0
        @@all << self
    end

    def self.all
        @@all
    end
end

