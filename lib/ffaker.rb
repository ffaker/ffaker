module Faker
  require 'ffaker/utils/module_utils'
  require 'ffaker/utils/array_utils'
  extend ModuleUtils
  Array.send :include, ArrayUtils

  LETTERS = k('a'..'z')

  def self.numerify(number_string)
    number_string.gsub(/#/) { rand(10).to_s }
  end

  def self.letterify(letter_string)
    letter_string.gsub(/\?/) { LETTERS.rand }
  end

  def self.bothify(string)
    letterify(numerify(string))
  end

  autoload :Address,     'ffaker/address'
  autoload :Company,     'ffaker/company'
  autoload :Internet,    'ffaker/internet'
  autoload :Lorem,       'ffaker/lorem'
  autoload :Name,        'ffaker/name'
  autoload :PhoneNumber, 'ffaker/phone_number'
  autoload :Geolocation, 'ffaker/geolocation'
  autoload :VERSION,     'ffaker/version'
end
