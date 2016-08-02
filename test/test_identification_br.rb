# encoding: utf-8

require 'helper'

class TestFakerIdentificationBR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::IdentificationBR,
    :cpf, :pretty_cpf, :rg, :pretty_rg, :gender
  )

  def setup
    @tester = FFaker::IdentificationBR
  end

  def test_cpf
    assert_match(/\A\d{11}\z/, @tester.cpf)
  end

  def test_pretty_cpf
    assert_match(/\A\d{3}.\d{3}.\d{3}-\d{2}\z/, @tester.pretty_cpf)
  end

  def test_rg
    assert_match(/\A\d{9}\z/, @tester.rg)
  end

  def test_gender
    assert_match(/\A(Feminino|Masculino)\z/, @tester.gender)
  end
end
