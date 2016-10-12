# encoding: utf-8

require 'helper'

class TestCompanyIT < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::CompanyIT,
    :name, :suffix, :prefix
  )

  def test_name
    assert_match(/.{4,}公司\z/, FFaker::CompanyCN.name)
  end

  def test_suffix
    assert_match(/公司\z/i, FFaker::CompanyCN.suffix)
  end

  def test_type
    assert_match(/.{2,}/i, FFaker::CompanyCN.type)
  end
end
