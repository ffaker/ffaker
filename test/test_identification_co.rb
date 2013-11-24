require 'helper'

class TestFakerIdentificationESCO < Test::Unit::TestCase
  include Test::Unit::Assertions
  def setup
    @tester = Faker::IdentificationESCO
  end

  def test_drivers_license
    # pattern \d{6,14}
    assert_match /\d{6,14}/, @tester.drivers_license
    assert @tester.drivers_license.length.between?(6,14)
  end

  def test_id
    assert @tester.method_defined? :id
  end

  def test_gender
    assert_match /(Hombre|Mujer)/, @tester.gender
  end

  def test_category
    assert_match /^([a][1-2]|[bc][1-3])$/i, @tester.driver_license_category
  end

  def test_blood_type
    assert_match /^(a|b|o|ab)[\+|\-]$/i, @tester.blood_type
  end

  def test_expedition_date
    test_today = Date.today
    # 1 today is bigger than result
    # 0 today is the same day as result
    # -1 today is smaller than expected
    assert_equal(1, test_today <=> @tester.expedition_date)
  end
end