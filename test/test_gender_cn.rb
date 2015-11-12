require 'helper'

class TestFakerGenderCN < Minitest::Test
  def setup
    @tester = FFaker::GenderCN
  end

  def test_random
    gender_regex = /\A[男女]\z/
    assert_match gender_regex, @tester.random
  end

end
