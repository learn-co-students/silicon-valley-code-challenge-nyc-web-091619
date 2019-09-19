class FundingRound
    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment

    @@all = []

    def initialize(startup, type, investment)
        @startup = startup
        @type = type
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end
end

