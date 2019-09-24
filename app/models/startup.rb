class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name=name
        @founder=founder
        @domain=domain
        @@all << self
    end

    def pivot(domain, name)
        @domain=(domain)
        @name=(name)
    end

    def self.all
        @@all
    end

    # def Startup.find_by_founder(founder)
    #     self.all.find do |startup|
    #         startup.founder == founder
    #     end
    # end

    def Startup.find_by_founder(founder) 
        self.all.find {|startup| startup.founder == founder}
    end

    
    def Startup.domains
        Startup.all.map {|startup| startup.domain}
    end

    # Startup#sign_contract
    # given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    def sign_contract(venture_capitalist, type, investment)
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
        my_fundings.map {|my_funding| my_fundings.venture_capitalist}.uniq!
    end

    def big_investors
        investors.select {|investor| investor.name == "Tres Commas club"}.uniq!
    end

end #End of Startup Class




# Startup#num_funding_rounds
# Returns the total number of funding rounds that the startup has gotten

# Startup#total_funds
# Returns the total sum of investments that the startup has gotten

# Startup#investors
# Returns a unique array of all the venture capitalists that have invested in this company

# Startup#big_investors
# Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club

