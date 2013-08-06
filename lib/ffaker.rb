module Faker
  VERSION = "1.18.0"

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

  autoload :Address,         'ffaker/address'
  autoload :AddressAU,       'ffaker/address_au'
  autoload :AddressCA,       'ffaker/address_ca'
  autoload :AddressDE,       'ffaker/address_de'
  autoload :AddressMX,       'ffaker/address_mx'
  autoload :AddressSE,       'ffaker/address_se'
  autoload :AddressSN,       'ffaker/address_sn'
  autoload :AddressUK,       'ffaker/address_uk'
  autoload :AddressUS,       'ffaker/address_us'
  autoload :BaconIpsum,      'ffaker/bacon_ipsum'
  autoload :Company,         'ffaker/company'
  autoload :CompanySE,       'ffaker/company_se'
  autoload :Conference,      'ffaker/conference'
  autoload :DizzleIpsum,     'ffaker/dizzle_ipsum'
  autoload :Education,       'ffaker/education'
  autoload :Geolocation,     'ffaker/geolocation'
  autoload :HTMLIpsum,       'ffaker/html_ipsum'
  autoload :HealthcareIpsum, 'ffaker/healthcare_ipsum'
  autoload :HipsterIpsum,    'ffaker/hipster_ipsum'
  autoload :Identification,  'ffaker/identification'
  autoload :Internet,        'ffaker/internet'
  autoload :InternetSE,      'ffaker/internet_se'
  autoload :Job,             'ffaker/job'
  autoload :Lorem,           'ffaker/lorem'
  autoload :LoremAR,         'ffaker/lorem_ar'
  autoload :LoremCN,         'ffaker/lorem_cn'
  autoload :Movie,           'ffaker/movie'
  autoload :Name,            'ffaker/name'
  autoload :NameCN,          'ffaker/name_cn'
  autoload :NameDE,          'ffaker/name_de'
  autoload :NameGA,          'ffaker/name_ga'
  autoload :NameJA,          'ffaker/name_ja'
  autoload :NameKR,          'ffaker/name_kr'
  autoload :NameMX,          'ffaker/name_mx'
  autoload :NamePH,          'ffaker/name_ph'
  autoload :NameRU,          'ffaker/name_ru'
  autoload :NameSE,          'ffaker/name_se'
  autoload :NameSN,          'ffaker/name_sn'
  autoload :PhoneNumber,     'ffaker/phone_number'
  autoload :PhoneNumberAU,   'ffaker/phone_number_au'
  autoload :PhoneNumberMX,   'ffaker/phone_number_mx'
  autoload :PhoneNumberSE,   'ffaker/phone_number_se'
  autoload :PhoneNumberSG,   'ffaker/phone_number_sg'
  autoload :PhoneNumberSN,   'ffaker/phone_number_sn'
  autoload :Product,         'ffaker/product'
  autoload :Regexp,          'ffaker/regexp'
  autoload :SSN,             'ffaker/ssn'
  autoload :SSNSE,           'ffaker/ssn_se'
  autoload :String,          'ffaker/string'
  autoload :Time,            'ffaker/time'
  autoload :Venue,           'ffaker/venue'
end
