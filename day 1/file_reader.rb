class FileReader
   def initialize
     @file_path = File.expand_path('puzzle_input.txt', __dir__)
     @left_column = []
     @right_column = []
     populate_columns
   end
 
   def columns
    [@left_column, @right_column]
   end

   def sorted_columns
     [@left_column.sort, @right_column.sort]
   end
   private
 
   def populate_columns
     return [@left_column, @right_column] if @left_column.any? || @right_column.any?
     File.foreach(@file_path) do |line|
       next if line.strip.empty?
       left, right = line.split
       @left_column << left
       @right_column << right
     end
     return [@left_column, @right_column] 
   end
 end
