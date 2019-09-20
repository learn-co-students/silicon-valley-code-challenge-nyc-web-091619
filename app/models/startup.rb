class Startup
    
    attr_reader :name, :domain, :founder

    @@all = []
    
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        @domain = domain
        @name = name
    end # given a string of a domain and a string of a name, change the domain and name of the startup. This is the only public method through which the domain can be changed.
     
    def sign_contract(venture_capitalist, investment_type, amount)
        FundingRound.new(self, investment_type, venture_capitalist, amount)
    end
    # given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    
    def my_funding_rounds
        FundingRound.all.select {|round| round.startup == self}
    end

    def num_funding_rounds
        my_funding_rounds.length
    end
    # Returns the total number of funding rounds that the startup has gotten

    def total_funds
        total = 0
        my_funding_rounds.each {|round| total += round.investment}
        total
    end
    # Returns the total sum of investments that the startup has gotten

    def investors
        my_funding_rounds.map {|round| round.venture_capitalist}.uniq
    end # Returns a unique array of all the venture capitalists that have invested in this company

    def big_investors
        investors.select {|investor| VentureCapitalist.tres_commas_club.any?(investor)}.uniq
    end
    # Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club

    def self.all
        @@all
    end # should return all of the startup instances


    def self.find_by_founder(founder_to_find)
        all.find do |startup|
            startup.founder == founder_to_find
        end
    end # given a string of a founder's name, returns the first startup whose founder's name matches
    
    
    def self.domains
        return_domains = all.map do |startup|
            startup.domain
        end
        return_domains.uniq
    end
    # should return an array of all of the different startup domains

end


