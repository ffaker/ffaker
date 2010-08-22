require 'helper'

class TestFakerNameCN < Test::Unit::TestCase
  def setup
    @tester = Faker::NameCN
  end

  def test_name
    #assert @tester.name.match(/(\w+\.? ?){2,3}/)
    puts @tester.name
  end

end
