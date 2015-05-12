module FFaker
  module ArrayUtils
    def self.const_array(argument)
      array = argument.is_a?(Array) ? argument : argument.to_a
      array.extend ArrayUtils
      freeze_all(array)
    end

    def self.random_pick(array, n)
      warn '[ArrayUtils.random_pick] is deprecated. Please use the Array#sample method'
      array.sample(n)
    end

    def self.rand(array)
      warn '[ArrayUtils.rand] is deprecated. Please use the Array#sample method'
      array.sample
    end

    def self.freeze_all(array)
      array.each(&:freeze)
      array.freeze
      array
    end

    def self.shuffle(array)
      array.sort_by{Kernel.rand}
    end

    def random_pick(n)
      warn '[ArrayUtils#random_pick] is deprecated. Please use the Array#sample method'
      self.sample(n)
    end

    def rand
      warn '[ArrayUtils#rand] is deprecated. Please use the Array#sample method'
      sample
    end

    def freeze_all
      ArrayUtils.freeze_all(self)
    end

    def shuffle
      ArrayUtils.shuffle(self)
    end
  end
end
