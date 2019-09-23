class Startup
    
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, domain, founder)
        @name = name
        @domain = domain
        @founder = founder
        @@all << self
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def sign_contract(venture_capitalist, type_of_investment, investment_amount)
        funding_round = FundingRound.new(self, venture_capitalist, type_of_investment, investment_amount)
    end

    def num_funding_rounds
        total_funding_rounds = 0
        my_funding_rounds = FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
        total_funding_rounds = my_funding_rounds.count
    end

    def total_funds
        my_total_funds = 0.0
        my_funding_rounds = FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
        my_funding_rounds.map do |funding_round|
            my_total_funds += funding_round.investment
        end
        my_total_funds
    end

    def investors
        my_investors = []
        my_funding_rounds = FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
        my_funding_rounds.map do |funding_round|
            my_investors << funding_round.venture_capitalist
        end
        my_investors.uniq
    end

    def big_investors
        self.investors.select do |investor|
            investor.total_worth >= 1000000000
        end
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end
end
