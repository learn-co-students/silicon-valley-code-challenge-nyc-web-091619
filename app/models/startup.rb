class Startup
  attr_accessor :name
  attr_reader :founder, :domain
  
  @@all = []

  # Class methods
  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find { |startup| startup.founder == founder }
  end

  def self.domains
    self.all.map { |startup| startup.domain }.uniq
  end
  
  # Instance methods

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def sign_contract(vc, type, amount)
    FundingRound.new(self, vc, type, amount)
  end
  # selects all FRs startup is involved in
  def funding_rounds
    FundingRound.all.select{|fr| fr.startup == self}
  end

  def num_funding_rounds
    self.funding_rounds.count
  end

  def total_funds
    self.funding_rounds.map {|fr| fr.investment}.reduce{|sum, investment| sum + investment}
  end

  def investors
    self.funding_rounds.map {|fr| fr.venture_capitalist}.uniq
  end

  def big_investors
    investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
  end




end #end startup
