require 'test_helper'

class TestAddressCHIT < Minitest::Test
  def test_ch_it_canton
    assert_match /\A[- a-zàèéìòóù]+\z/i, FFaker::AddressCHIT.canton
  end
end
