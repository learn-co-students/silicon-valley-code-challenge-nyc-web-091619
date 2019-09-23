class VentureCapitalist
    attr_accessor :name, :total_worth
    attr_reader

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth.to_f
        @@all << self
    end

    def self.all
        @@all
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
        @total_worth -= investment
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map {|funding_round| funding_round.startup}.uniq
    end

    def biggest_investment
        largest_investment = funding_rounds.max {|f1, f2| f1.investment <=> f2.investment}
    
    end

    def invested(domain)
        # ventures = funding_rounds.select {|funding_round| funding_round.startup.domain == domain}
        # ventures.map {|venture| venture.investment}.reduce{|sum, n| sum+ n}
        funding_rounds.select{ |funding_round| funding_round.startup.domain == domain }
            .map{ |venture| venture.investment }.reduce{ |sum, n|sum + n }
    end

end #end of VentureCapitalist class
