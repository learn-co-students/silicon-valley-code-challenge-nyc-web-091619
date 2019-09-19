class FundingRound
  attr_reader :startup, :venture_capitalist
  attr_accessor :type, :investment

  @@all = []

  def initialize(startup, vc, type, investment)
    @startup = startup
    @venture_capitalist = vc
    @type = type
    @investment = (investment > 0) ? (investment.to_f) : (0.0)

    @@all << self
  end

  def self.all
    @@all
  end
end
