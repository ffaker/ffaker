# frozen_string_literal: true

require_relative 'helper'

class TestCode < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Code, :ean, :npi)

  def test_npi_legacy_regexp
    assert FFaker::Code.npi(legacy: true).match(/\A(1|2)[0-9]{9}\z/)
  end

  def test_npi
    FFaker::Random.seed = 523_456_789
    assert FFaker::Code.npi == '7411850515'
  end

  def test_deterministic_npi
    FFaker::Random.seed = 42
    v = FFaker::Code.npi
    FFaker::Random.reset!
    assert v == FFaker::Code.npi
  end

  def test_valid_npi
    FFaker::Random.seed = 123_456_789
    assert FFaker::Code.npi == '2410167607'
  end

  def test_ean
    assert FFaker::Code.ean.match(/^\d{13}$/)
  end

  def test_ean_deterministic
    FFaker::Random.seed = 10
    assert_equal FFaker::Code.ean, '1399378750693'
  end
end
