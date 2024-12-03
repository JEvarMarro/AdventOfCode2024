class Report
  MINIMUN_GAP_TOLERATED = 1
  MAXIMUM_GAP_TOLERATED = 3

  def initialize(levels)
    @levels = levels.map(&:to_i)
  end

  def safe?
    return false if @levels.size < 2

    increasing = true
    decreasing = true

    @levels.each_cons(2).all? do |level1, level2|
      gap = (level1 - level2).abs
      tolerated_gap = gap >= MINIMUN_GAP_TOLERATED && gap <= MAXIMUM_GAP_TOLERATED

      increasing &&= level1 < level2
      decreasing &&= level1 > level2

      tolerated_gap
    end && (increasing || decreasing)
  end
end