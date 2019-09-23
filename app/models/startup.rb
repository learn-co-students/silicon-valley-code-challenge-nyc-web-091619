class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name= name
    end

    def self.all
        @@all
    end

    def Startup.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def Startup.domains
        Startup.all.map { |startup| startup.domain } 
    end

    def sign_contract(venture_capitalist, type, investment)
        venture_capitalist.total_worth -= investment
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def my_fundings
        FundingRound.all.select {|funding_round| funding_round.startup == self}
    end

    def num_funding_rounds
        my_fundings.count
    end

    def total_funds
        my_fundings.map {|my_funding| my_funding.investment}.inject { |sum, n| sum + n }
    end

    def investors
        my_fundings.map {|my_funding| my_funding.venture_capitalist}.uniq
    end

    def big_investors
        investors.select {|investor| investor.name == "Tres commas club"}.uniq
    end


end #end of Startup class
