require 'test/unit'
require File.dirname(__FILE__) + '/saddle_points'

class SaddlePointsTest < Test::Unit::TestCase  
  def setup
    @arr1 = [[39, 43, 49, 29, 18], [30, 47, 24, 29, 15], [49, 50, 39, 20, 33], [18, 38, 35, 32, 35], [29, 44, 18, 34, 44]]
    @arr2 = [[50, 27, 36, 43, 39], [36, 14, 35, 40, 19], [20, 33, 48, 32, 40], [41, 40, 15, 22, 19], [21, 24, 24, 31, 18]]
    @arr3 = [[39, 43, 49, 29, 18], [30, 47, 24, 29, 15], [49, 50, 39, 20, 33], [18, 38, 35, 32, 38], [29, 44, 18, 34, 44]]
    @arr4 = [[39, 43, 49, 29, 99], [30, 47, 24, 29, 99], [49, 50, 39, 20, 99], [18, 38, 35, 32, 38], [29, 44, 18, 34, 99]]
    @arr5 = [[39, 43, 49, 29, 48], [30, 47, 24, 29, 44], [49, 50, 39, 20, 40], [18, 38, 35, 32, 38], [29, 38, 18, 34, 38]]
  end

  def test_saddle_points_in_arr1
    points = SaddlePoints.new(@arr1)
    assert_equal "[3][1]", points.print_saddle_points
  end

  def test_saddle_points_in_arr2
    points = SaddlePoints.new(@arr2)
    assert_equal "No saddle points found", points.print_saddle_points
  end

  def test_saddle_points_in_arr3
    points = SaddlePoints.new(@arr3)
    assert_equal "[3][1]", points.print_saddle_points
  end

  def test_saddle_points_in_arr4
    points = SaddlePoints.new(@arr4)
    assert_equal "[3][1],[3][4]", points.print_saddle_points
  end

  def test_saddle_points_in_arr5
    points = SaddlePoints.new(@arr5)
    assert_equal "[3][1],[3][4],[4][1],[4][4]", points.print_saddle_points
  end
end