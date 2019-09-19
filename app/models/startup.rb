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


