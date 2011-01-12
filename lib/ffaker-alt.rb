module Faker
  VERSION = "1.0.0"

  require 'ffaker-alt/utils/module_utils'

  extend ModuleUtils

  LETTERS = k('a'..'z')

  def self.numerify(number_string)
    number_string.gsub!(/#/) { rand(10).to_s }
    number_string
  end

  def self.letterify(letter_string)
    letter_string.gsub!(/\?/) { LETTERS.rand }
    letter_string
  end

  def self.bothify(string)
    letterify(numerify(string))
  end

  autoload :Address,     'ffaker-alt/address'
  autoload :Company,     'ffaker-alt/company'
  autoload :Internet,    'ffaker-alt/internet'
  autoload :Lorem,       'ffaker-alt/lorem'
  autoload :Name,        'ffaker-alt/name'
  autoload :PhoneNumber, 'ffaker-alt/phone_number'
  autoload :Geolocation, 'ffaker-alt/geolocation'
  autoload :VERSION,     'ffaker-alt/version'
end
