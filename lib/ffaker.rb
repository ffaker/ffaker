module FFaker
  VERSION = '2.2.0'.freeze

  require 'ffaker/utils/array_utils'
  require 'ffaker/utils/module_utils'

  extend ModuleUtils

  BASE_LIB_PATH = File.expand_path('..', __FILE__)

  LETTERS = [*'a'..'z'].freeze

  HEX = %w[0 1 2 3 4 5 6 7 8 9 A B C D E F].freeze

  def self.hexify(*masks)
    fetch_sample(masks.flatten).gsub(/#/) { fetch_sample(HEX) }
  end

  def self.numerify(*masks)
    fetch_sample(masks.flatten).gsub(/#/) { rand(0..9).to_s }
  end

  def self.letterify(*masks)
    fetch_sample(masks.flatten).gsub(/\?/) { fetch_sample(LETTERS) }
  end

  def self.bothify(masks)
    letterify(numerify(masks))
  end

  # Load all constants.
  Dir["#{BASE_LIB_PATH}/ffaker/*.rb"].sort.each do |f|
    require "ffaker/#{File.basename(f, '.rb')}"
  end

  # Random Number Generator (RNG) used with ModuleUtils#fetch, #shuffle, #rand
  # in order to provide deterministic repeatability.
  module Random
    # Returns the current RNG seed.
    def self.seed
      @random_seed ||= ::Random.new_seed
    end

    # Sets the RNG seed and creates a new internal RNG.
    def self.seed=(new_seed)
      @random_seed = new_seed
      reset!
      new_seed
    end

    # Reset the RNG back to its initial state.
    def self.reset!
      @rng = new_rng
    end

    # Returns a random number using an RNG with a known seed.
    def self.rand(max = nil)
      if max
        rng.rand(max)
      else
        rng.rand
      end
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
