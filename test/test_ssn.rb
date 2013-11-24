# encoding: utf-8

require 'helper'

class TestSSN < Test::Unit::TestCase

  def test_ssn
    assert_match(/\d{3}-\d{2}-\d{3}/, Faker::SSN.ssn)
  end

end
