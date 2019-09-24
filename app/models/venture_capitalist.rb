
class VentureCapitalist

    attr_accessor :name, :total_worth
    attr_reader

    @@all = []

    def initialize(name, total_worth)
        @name=name
        @total_worth=total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def offer_contract(Startup, type, investment)
        FundingRound.new(self, startup, type, investment)
    end
    
    def funding_rounds
        self.FundingRound.all
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
    end


    def portfolio #Returns a unique list of all startups this venture capitalist has funded
        funding_rounds.map {|funding_round| funding_round.startup}.uniq
    end

    def biggest_investment #returns the largest funding round given by this venture capitalist
        funding_rounds.may_by {|funding_round| funding_round.venture_capitalist}.uniq
    end

    def invested(domain) #given a domain string, returns the total amount invested in that domain
        total_worth
    end

end # End of VentureCapitalist Class


