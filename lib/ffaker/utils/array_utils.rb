# frozen_string_literal: true

require_relative 'random_utils'

module FFaker
  module ArrayUtils
    extend RandomUtils

    def self.const_array(argument)
      array = argument.is_a?(Array) ? argument : argument.to_a
      array.extend ArrayUtils
      freeze_all(array)
    end

    def self.random_pick(array, num)
      warn '[ArrayUtils.random_pick] is deprecated. Please use the ModuleUtils#fetch_sample method'
      fetch_sample(array, count: num)
    end

    def self.rand(array)
      warn '[ArrayUtils.rand] is deprecated. Please use the ModuleUtils#fetch_sample method'
      fetch_sample(array)
    end

    def self.freeze_all(array)
      array.each(&:freeze)
      array.freeze
      array
    end

    def self.shuffle(array)
      array.sort_by { FFaker::Random.rand }
    end

    def random_pick(num)
      warn '[ArrayUtils#random_pick] is deprecated. Please use the ModuleUtils#fetch_sample method'
      ArrayUtils.random_pick(self, num)
    end

    def rand
      warn '[ArrayUtils#rand] is deprecated. Please use the ModuleUtils#fetch_sample method'
      ArrayUtils.rand(self)
    end

    def freeze_all
      ArrayUtils.freeze_all(self)
    end

    def shuffle
      ArrayUtils.shuffle(self)
    end
  end
end
