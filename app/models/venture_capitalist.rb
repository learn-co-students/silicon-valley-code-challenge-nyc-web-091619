class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |venture_capitalist|
            venture_capitalist.total_worth >= 1000000000
        end
    end

    def offer_contract(startup, type_of_investment, amount)
        funding_round = FundingRound.new(startup, self, type_of_investment, amount)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
    end

    def portfolio
        my_funding_rounds = self.funding_rounds
        portfolio = my_funding_rounds.map do |funding_round|
            funding_round.startup
        end
        portfolio.uniq
    end

    def biggest_investment
        my_funding_rounds = self.funding_rounds
        my_biggest_investment = my_funding_rounds.max_by do |funding_round|
            funding_round.investment
        end
        # my_funding_rounds.find do |funding_round|
        #     funding_round.investment == my_biggest_investment
        # end
        # binding.pry
    end

    def invested(domain)
        amount_invested = 0.0
        my_funding_rounds = self.funding_rounds.select do |funding_round|
            funding_round.startup.domain == domain
        end
        my_funding_rounds.map do |funding_round|
            amount_invested += funding_round.investment
        end
        amount_invested
    end

end