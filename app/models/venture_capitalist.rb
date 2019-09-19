class VentureCapitalist
  attr_accessor :name, :total_worth

  @@all = []

  # Class methods
  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth

    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select {|vc| vc.total_worth > 1000000000 }
  end

  # Instance methods
  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|fr| fr.venture_capitalist == self}
  end

  def portfolio
    self.funding_rounds.map {|fr| fr.startup }.uniq
  end

  def biggest_investment
    self.funding_rounds.max_by {|fr| fr.investment}
  end

  def invested(domain)
    binding.pry
    doms = self.funding_rounds.select {|fr| Startup.domain == domain}
    doms.map{|fr| fr.investment}.reduce{|sum, investment| sum + investment}
    
  end
end # END venture capitalist
