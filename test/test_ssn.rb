# encoding: utf-8

require File.dirname(__FILE__) + '/helper'

class TestSSN < Test::Unit::TestCase

  def test_ssn
    assert_match(/\d{3}-\d{2}-\d{3}/, Faker::SSN.ssn)
  end

end
