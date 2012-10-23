class SaddlePoints
  def initialize(saddle_points_array)
    @saddle_points_array = saddle_points_array
    @saddle_points = Array.new
    find_saddle_points
  end

  def print_saddle_points
    @saddle_points.empty? ? "No saddle points found" : @saddle_points.join(",")
  end
  
  private

  def find_saddle_points
    @saddle_points_array.length.times do |i|
      find_max_cols_in_row(i).each do |max_col_in_row|
        min_rows_in_col = find_min_rows_in_col(max_col_in_row)
        @saddle_points << "[#{i}][#{max_col_in_row}]" if min_rows_in_col.include? i
      end
    end  
  end
  
  def find_max_cols_in_row(row_index)
    maxes = Array.new
    max   = @saddle_points_array[row_index].each_with_index.max[0]
    @saddle_points_array[row_index].each_with_index { |num, index| maxes << index if num == max }
    maxes
  end

  def find_min_rows_in_col(col_index)
    mins    = Array.new
    min_num = @saddle_points_array[0][col_index]
    @saddle_points_array.length.times { |i| min_num = @saddle_points_array[i][col_index] if @saddle_points_array[i][col_index] < min_num }
    @saddle_points_array.length.times { |i| mins << i if @saddle_points_array[i][col_index] == min_num }
    mins
  end
end