class TennisScorer
  OPP = { :server => :receiver, :receiver => :server }

  def initialize
    @score = { :server => 0, :receiver => 0 }
  end
  def score
    "#{@score[:server]*15}-#{@score[:receiver]*15}"
  end
  def give_point_to(player)
    other = OPP[player]
    fail "unkown player #{player}" unless other
    @score[player] += 1
  end
end