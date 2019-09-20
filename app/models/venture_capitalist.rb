require "pry"
class VentureCapitalist

    attr_reader :name
    attr_accessor :total_worth

    @@all = []
    
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, investment_type, amount)
        self.total_worth -= amount
        FundingRound.new(startup, investment_type, self, amount)
    end # given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    
    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end # returns an array of all funding rounds for that venture capitalist

    def portfolio
        funding_rounds.map {|round| round.startup}.uniq
    end# Returns a unique list of all startups this venture capitalist has funded

    def biggest_investment
        funding_rounds.max_by {|round| round.investment}
    end# returns the largest funding round given by this venture capitalist

    def invested(domain)
        total = 0
        funding_rounds.each do |round|
            if round.startup.domain == domain
                total += round.investment
            end
        end
        total
    end# given a domain string, returns the total amount invested in that domain

    def self.tres_commas_club
        all.select do |venture_capitalist|
            venture_capitalist.total_worth > 1000000000
        end
    end # returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)

    def self.all
        @@all
    end


end




