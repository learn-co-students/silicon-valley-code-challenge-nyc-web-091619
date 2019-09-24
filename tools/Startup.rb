# require 'pry'

class Startup

    attr_accessor :name, :founder, :domain


    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def find_by_founder(name)
        Startup.all.find do |company|
            company.founder == name
        end
    end

    def self.domains
        Startup.all.map do |company|
            company.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        (FundingRound.all.select {|fr| fr.startup == self}).count
    end

    def total_funds
        frs = FundingRound.all.select {|fr| fr.startup == self}
        frs.inject {|sum, n| sum.investment + n.investment}
    end

end #end Startup Class