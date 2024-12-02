require_relative '../score_calculator'

class DistanceCalculator < ScoreCalculator
  def initialize
    @left_column, @right_column = FileReader.new.sorted_columns
    super
  end
 
  private
 
  def calculate
    for i in 0...collection_size
      @result += calculate_distance_between(i)
    end
  end
  
  def calculate_distance_between(index)
    (@left_column[index].to_i - @right_column[index].to_i).abs
  end
 
  def collection_size
    [@left_column.size, @right_column.size].min
  end
 
  def distance_calculator
    @distance_calculator ||= DistanceCalculator.new
  end
end
