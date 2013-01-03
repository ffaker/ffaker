require 'helper'

class TestFaker < Test::Unit::TestCase
  def test_numerify
    assert Faker.numerify('###').match(/\d{3}/)
  end
  
  def test_numerify_with_array
    assert Faker.numerify(['###', '###']).match(/\d{3}/)
  end

  def test_letterify
    assert Faker.letterify(false, '???').match(/[a-z]{3}/)
  end

  def test_capital_letterify
    assert Faker.letterify(true, '???').match(/[A-Z]{3}/)
  end

  def test_letterify_with_array
    assert Faker.letterify(false, ['???', '???']).match(/[a-z]{3}/)
  end

  def test_capital_letterify_with_array
      assert Faker.letterify(true, ['???', '???']).match(/[A-Z]{3}/)
    end

  def test_bothify
    assert Faker.bothify('???###').match(/[a-z]{3}\d{3}/)
  end

  def test_capital_bothify
    assert Faker.bothify(true, '???###').match(/[A-Z]{3}\d{3}/)
  end

  def test_bothify_with_array
    assert Faker.bothify(false, ['???###', '???###']).match(/[a-z]{3}\d{3}/)
  end

  def test_capital_bothify_with_array
    assert Faker.bothify(true, ['???###', '???###']).match(/[A-Z]{3}\d{3}/)
  end
end
