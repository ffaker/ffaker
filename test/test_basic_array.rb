require 'helper'

class TestBasicArray < Test::Unit::TestCase

  it 'shouldnt override basic rand commands on arrays' do
    #Causes NoMethodError: private method `rand' called for #<Array:XX> errors
    value = Array(1..5).rand
    assert value <= 5
    assert value >= 1
  end

end
