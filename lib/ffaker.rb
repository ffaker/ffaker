module Faker
  VERSION = "1.12.1"

  require 'ffaker/utils/array_utils'
  require 'ffaker/utils/module_utils'

  extend ModuleUtils

  LETTERS = k('a'..'z')

  def self.numerify(*masks)
    mask = ArrayUtils.rand(masks.flatten)
    mask.gsub!(/#/) { rand(10).to_s }
    mask
  end

  def self.letterify(*masks)
    mask = ArrayUtils.rand(masks.flatten)
    mask.gsub!(/\?/) { LETTERS.rand }
    mask
  end

  def self.bothify(masks)
    letterify(numerify(masks))
  end

  autoload :Address,       'ffaker/address'
  autoload :AddressUS,     'ffaker/address_us'
  autoload :AddressDE,     'ffaker/address_de'
  autoload :AddressCA,     'ffaker/address_ca'
  autoload :AddressUK,     'ffaker/address_uk'
  autoload :AddressAU,     'ffaker/address_au'
  autoload :Company,       'ffaker/company'
  autoload :Education,     'ffaker/education'
  autoload :Geolocation,   'ffaker/geolocation'
  autoload :HTMLIpsum,     'ffaker/html_ipsum'
  autoload :HipsterIpsum,  'ffaker/hipster_ipsum'
  autoload :Internet,      'ffaker/internet'
  autoload :Lorem,         'ffaker/lorem'
  autoload :LoremCN,       'ffaker/lorem_cn'
  autoload :Name,          'ffaker/name'
  autoload :NameCN,        'ffaker/name_cn'
  autoload :NameDE,        'ffaker/name_de'
  autoload :NameJA,        'ffaker/name_ja'
  autoload :NameRU,        'ffaker/name_ru'
  autoload :NameSN,        'ffaker/name_sn'
  autoload :PhoneNumber,   'ffaker/phone_number'
  autoload :PhoneNumberSN, 'ffaker/phone_number_sn'
  autoload :PhoneNumberAU, 'ffaker/phone_number_au'
  autoload :Product,       'ffaker/product'
  autoload :VERSION,       'ffaker/version'
end
