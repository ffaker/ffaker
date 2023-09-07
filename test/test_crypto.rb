# frozen_string_literal: true

require_relative 'helper'

class TestCrypto < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(FFaker::Crypto, :sha256)

  def test_sha256
    assert FFaker::Crypto.sha256.is_a?(String)
    assert FFaker::Crypto.sha256.length == 64
    assert_match(/\A[a-z\d]{64}\z/, FFaker::Crypto.sha256)
  end
end
