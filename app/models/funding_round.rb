class FundingRound

    attr_accessor  :type, :investment
    attr_reader :startup, :venture_capitalist

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup=startup
        @type=type
        @investment=
            if investment < 0
                investment = 0.0
            else
                investment = investment.to_f
            end

        @@all <<self
    end

    def self.all
        @@all
    end

    #Instance Methods

    def 

end #End of FundingRound class

