require_relative '../score_calculator'

class SimilarityScoreCalculator < ScoreCalculator
   def initialize
      @left_column, @right_column = FileReader.new.columns
      super
   end

   def calculate
      @left_column.each do |left_item|
         @result += (@right_column.filter { |right_item| left_item == right_item }.count * left_item.to_i)
      end
   end
end
