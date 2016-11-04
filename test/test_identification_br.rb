# encoding: utf-8

require 'helper'

class TestFakerIdentificationBR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::IdentificationBR,
    :cpf, :pretty_cpf, :cnpj, :pretty_cnpj, :rg, :pretty_rg, :gender
  )

  def setup
    @tester = FFaker::IdentificationBR
  end

  def test_cpf
    cpf = @tester.cpf
    verification_digits = @tester.cpf_verification_digits(cpf[0..8])
    assert(cpf[9..10] == verification_digits.join)
    assert_match(/\A\d{11}\z/, cpf)
  end

  def test_pretty_cpf
    assert_match(/\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, @tester.pretty_cpf)
  end

  def test_cnpj
    cnpj = @tester.cnpj
    verification_digits = @tester.cnpj_verification_digits(cnpj[0..11])
    assert(cnpj[12..13] == verification_digits.join)
    assert_match(/\A\d{14}\z/, cnpj)
  end

  def test_pretty_cnpj
    assert_match(%r{\A\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}\z}, @tester.pretty_cnpj)
  end

  def test_rg
    assert_match(/\A\d{9}\z/, @tester.rg)
  end

  def test_gender
    assert_match(/\A(Feminino|Masculino)\z/, @tester.gender)
  end
end
