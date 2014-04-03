# encoding: utf-8

require 'helper'

class TestCompanyIT < Test::Unit::TestCase

  def test_name
    assert_match(/[ a-z]+/, Faker::CompanyIT.name)
  end

  def test_suffix
    assert_match(/[ a-z]+/i, Faker::CompanyIT.suffix)
  end
  
    def test_prefix
    assert_match(/[ a-z]+/i, Faker::CompanyIT.prefix)
  end
end
