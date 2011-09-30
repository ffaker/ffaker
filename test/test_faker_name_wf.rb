
require 'helper'


class TestFakerNameWf < Test::Unit::TestCase
  
  def setup
    @tester = Faker::NameWf
  end
  
  def test_male_last_name
    assert Faker::NameWf::LAST_NAMES.include?(@tester.last_name)
  end
    
end
