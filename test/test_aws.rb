# encoding: utf-8

require 'helper'

class TestAWS < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::AWS, :instance_type)

  def test_instance_type
    assert_match(/\A[a-z]+\d\.\d*[a-z]+/, FFaker::AWS.instance_type)
  end

  def test_offering_type
    assert_match(/\A[ a-zA-Z]+\z/i, FFaker::AWS.offering_type)
  end

  def test_instance_tenancy
    assert_match(/\A(?:default|dedicated|host)+\z/i, FFaker::AWS.instance_tenancy)
  end

  def test_product_description
    assert_match(%r{\A[ \/a-zA-Z\(\)]+\z}i, FFaker::AWS.product_description)
  end
end
