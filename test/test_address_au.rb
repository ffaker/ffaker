# => author: wiseleyb
# => email: wiseleyb@gmail.com
require 'helper'

class TestAddressAU < Test::Unit::TestCase
  
  def test_au_state_abbr
    arr = Faker::AddressAU::STATE_ABBR.sort
    assert arr = Faker::AddressAU::CITY.keys.sort
    assert arr = Faker::AddressAU::ZIP_CODE.keys.sort
  end
  
  def test_au_state
    assert_match /[ a-z]/, Faker::AddressAU.state
  end

  def test_au_state_abbr
    assert_match /[A-Z]/, Faker::AddressAU.state_abbr
  end

  def test_au_city
    assert_match /[a-zA-Z]/, Faker::AddressAU.city
  end
  
  def test_zip_code
    assert_match /\d{4}/, Faker::AddressAU.zip_code
  end

  def test_postcode
    assert_match /\d{4}/, Faker::AddressAU.postcode
  end

  def test_full_address
    assert_match /[\, a-z]/, Faker::AddressAU.full_address
  end
  
  def test_zip_code_frozen
    assert Faker::AddressAU.zip_code.frozen? == false
  end

  def test_au_city_with_states
    Faker::AddressAU::STATE_ABBR.each do |st_abbr|
      assert_match /[a-zA-Z]/, Faker::AddressAU.city(st_abbr)
    end
  end

  def test_zip_code_with_states
    Faker::AddressAU::STATE_ABBR.each do |st_abbr|
      assert_match /\d{4}/, Faker::AddressAU.zip_code(st_abbr)
    end
  end

  def test_full_address_with_states
    Faker::AddressAU::STATE_ABBR.each do |st_abbr|
      assert_match /[\, a-z]/, Faker::AddressAU.full_address(st_abbr)
    end
  end

end
