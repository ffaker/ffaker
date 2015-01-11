# encoding: utf-8

require 'helper'

class TestCompanyIT < Test::Unit::TestCase

  def test_name
    assert_match(/[ a-z]+/, FFaker::CompanyIT.name)
  end

  def test_suffix
    assert_match(/[ a-z]+/i, FFaker::CompanyIT.suffix)
  end

    def test_prefix
    assert_match(/[ a-z]+/i, FFaker::CompanyIT.prefix)
  end
end
