# encoding: utf-8

require 'helper'

class TestFakerIdentification < Test::Unit::TestCase
  def setup
    @tester = Faker::Identification
  end

  def test_drivers_license
    ###-###-##-###-#
    assert_match /[A-Z]\d{3}-\d{3}-\d{2}-\d{3}-\d{1}/, @tester.drivers_license
  end

  def test_ssn
    assert_match /\d{3}-\d{2}-\d{4}/, @tester.ssn
  end

  def test_gender
    assert_match /(Male|Female)/, @tester.gender
  end

  def test_ethnicity
    ethnicity_regex = /(African American|Asian\/Pacific Islander|Caucasian|Hispanic|Native American|Multiracial|Other|Prefer not to respond)/
    assert_match ethnicity_regex, @tester.ethnicity
  end
end
