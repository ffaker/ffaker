# encoding: utf-8

require 'helper'

class TestSSN < Minitest::Test

  def test_ssn
    assert_match(/\d{3}-\d{2}-\d{3}/, FFaker::SSN.ssn)
  end

end
