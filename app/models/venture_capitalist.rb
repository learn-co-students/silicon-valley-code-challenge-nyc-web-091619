class VentureCapitalist

    attr_reader :name
    attr_accessor :total_worth

    @@all = []
    
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.tres_commas_club
        all.select do |venture_capitalist|
            venture_capitalist.total_worth > 1000000000
        end
    end # returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)

    def self.all
        @@all
    end
end




