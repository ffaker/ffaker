module Faker
  module ArrayUtils
    def self.const_array(argument)
      array = argument.is_a?(Array) ? argument : argument.to_a
      array.extend ArrayUtils
      freeze_all(array)
    end

    def self.random_pick(array, n, duplicates = false)
      if duplicates
        indexes = Array.new(n) { |i| Kernel.rand(array.length) }
      else
        indexes = (0...array.length).sort_by{Kernel.rand}[0...n]
      end
      indexes.map { |n| array[n].dup }
    end

    def self.rand(array)
      array[Kernel.rand(array.length)].dup
    end

    def self.freeze_all(array)
      array.each { |e| e.freeze }
      array.freeze
      array
    end

    def self.shuffle(array)
      array.sort_by{Kernel.rand}
    end

    def random_pick(n, duplicates = false)
      ArrayUtils.random_pick(self, n, duplicates)
    end

    def rand
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
