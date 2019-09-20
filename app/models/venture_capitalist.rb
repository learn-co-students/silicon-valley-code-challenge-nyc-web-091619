require 'pry'

class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tre_commas_club
        @@all.select{|capitalist| capitalist.total_worth >= 1000000000}
    end

    def offer_contract(startup, inv_type, amount)
        self.total_worth -= amount
        FundingRound.new(startup, self, inv_type, amount)
    end

    def funding_rounds
        FundingRound.count{|round|round.venture_capitalist == self}
    end

    def portfolio
        rounds = FundingRound.select do |round|
            round.venture_capitalist == self
        end
        rounds.map{|round| round.startup}.uniq
    end

    def biggest_investment
        rounds = FundingRound.select do |round|
            round.venture_capitalist == self
        end
        rounds.max_by{|round|round.investment}
    end

    def invested(domain)
        FundingRound.each do |round| 
            return round.investment if round.startup.domain = domain
        end
    end
    
    binding.pry

end
 