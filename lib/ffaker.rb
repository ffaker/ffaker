# frozen_string_literal: true

require_relative 'ffaker/version'
require 'pathname'

module FFaker
  require_relative 'ffaker/utils/array_utils'
  require_relative 'ffaker/utils/module_utils'

  extend ModuleUtils

  BASE_LIB_PATH = File.expand_path(__dir__)

  LETTERS = Array('a'..'z').freeze

  HEX = %w[0 1 2 3 4 5 6 7 8 9 A B C D E F].freeze

  def self.hexify(*masks)
    fetch_sample(masks.flatten).gsub('#') { fetch_sample(HEX) }
  end

  def self.numerify(*masks)
    fetch_sample(masks.flatten).gsub('#') { rand(0..9).to_s }
  end

  def self.letterify(*masks)
    fetch_sample(masks.flatten).gsub('?') { fetch_sample(LETTERS) }
  end

  def self.bothify(masks)
    letterify(numerify(masks))
  end

  autoload_acronyms = {
    'ar' => 'AR',
    'au' => 'AU',
    'aws' => 'AWS',
    'br' => 'BR',
    'ca' => 'CA',
    'ch' => 'CH',
    'cl' => 'CL',
    'cn' => 'CN',
    'co' => 'CO',
    'cs' => 'CS',
    'cu' => 'CU',
    'da' => 'DA',
    'de' => 'DE',
    'ec' => 'EC',
    'en' => 'EN',
    'es' => 'ES',
    'fi' => 'FI',
    'fr' => 'FR',
    'ga' => 'GA',
    'gr' => 'GR',
    'html' => 'HTML',
    'id' => 'ID',
    'ie' => 'IE',
    'in' => 'IN',
    'it' => 'IT',
    'ja' => 'JA',
    'jp' => 'JP',
    'kh' => 'KH',
    'kr' => 'KR',
    'mx' => 'MX',
    'nb' => 'NB',
    'nl' => 'NL',
    'ph' => 'PH',
    'pl' => 'PL',
    'ru' => 'RU',
    'se' => 'SE',
    'sg' => 'SG',
    'sn' => 'SN',
    'ssn' => 'SSN',
    'th' => 'TH',
    'tw' => 'TW',
    'ua' => 'UA',
    'uk' => 'UK',
    'us' => 'US',
    'vn' => 'VN'
  }

  directory = "#{__dir__}/ffaker"
  Dir["#{directory}/*.rb"].each do |file_name|
    relative_file_path = Pathname.new(file_name).relative_path_from(directory).to_s.chomp('.rb')
    ## Don't consider files in sub-directories
    constant_name = relative_file_path.split('_').map do |part|
      autoload_acronyms.fetch(part) { part.capitalize }
    end.join
    autoload constant_name, file_name
  end

  # Random Number Generator (RNG) used with ModuleUtils#fetch, #shuffle, #rand
  # in order to provide deterministic repeatability.
  module Random
    # Returns the current RNG seed.
    def self.seed
      @seed ||= ::Random.new_seed
    end

    # Sets the RNG seed and creates a new internal RNG.
    def self.seed=(new_seed)
      @seed = new_seed
      reset!
      new_seed
    end

    # Reset the RNG back to its initial state.
    def self.reset!
      @rng = new_rng
    end

    # Returns a random number using an RNG with a known seed.
    def self.rand(max = nil)
      return rng.rand(max) if max

      rng.rand
    end

    # Returns the current Random object.
    def self.rng
      @rng ||= new_rng
    end

    # Returns a new Random object instantiated with #seed.
    def self.new_rng
      ::Random.new(seed)
    end
  end
end
