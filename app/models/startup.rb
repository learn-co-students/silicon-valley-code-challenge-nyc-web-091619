require 'pry'

class Startup
    attr_reader :domain, :founder
    attr_accessor :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, domain, founder)
        @name = name
        @domain = domain
        @founder = founder
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(founders_name)
        @@all.find{|startup| startup.founder == founders_name}
    end

    def self.domains
        @all.select{|startup| startup.domain = self.domain}.uniq
    end

    def sign_contract(vent_cap, inv_type, amount)
        FundingRound.new(self, vent_cap, inv_type, amount)
    end

    def num_funding_rounds
        FundingRound.count do |round|
            FundingRound.startup == self
        end
    end

    def total_funds
        funds = 0.0
        FundingRound.each do |round|
            funds+=round.investment  if round.startup == self
        end
        funds
    end

    def investors
        FundingRound.map{|round|round.venture_capitalist}.uniq
    end

    def big_investors
        FundingRound.select do |round|
            round.startup == self and round.venture_capitalist.tre_commas_club
        end
    end
    binding.pry
    0

end
 