module Faker
  VERSION = "1.32.1"

  require 'ffaker/utils/array_utils'
  require 'ffaker/utils/module_utils'

  extend ModuleUtils

  BASE_LIB_PATH = File.expand_path("..", __FILE__)

  LETTERS = [*'a'..'z']

  HEX = %w(0 1 2 3 4 5 6 7 8 9 A B C D E F)

  def self.hexify(*masks)
    masks.flatten.sample.gsub(/#/) { HEX.sample }
  end

  def self.numerify(*masks)
    masks.flatten.sample.gsub(/#/) { rand(10).to_s }
  end

  def self.letterify(*masks)
    masks.flatten.sample.gsub(/\?/) { LETTERS.sample }
  end

  def self.bothify(masks)
    letterify(numerify(masks))
  end

  # Load all constants.
  Dir["#{BASE_LIB_PATH}/ffaker/*.rb"].sort.each do |f|
    require "ffaker/#{File.basename(f, '.rb')}"
  end
end
