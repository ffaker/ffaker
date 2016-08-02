module FFaker
  # Methods for returning repeatably-random data using the internal
  # Random Number Generator. You should not need to use this directly, it is
  # automatically included when you `include ModuleUtils` in a FFaker module.
  module RandomUtils
    # Returns a randon number from the internal Random Number Generator. Can be
    # used in place of `rand` or `Kernal.rand`.
    def rand(max = nil)
      FFaker::Random.rand(max)
    end

    # Performs Array#sample on `list` using a the internal Random Number
    # Generator so that the results are deterministic.
    #
    # * Returns one random item from `list`.
    # * Pass `count: n` in options argument, where `n` is an integer, to
    # return *n* items from `list`
    def fetch_sample(list, options = {})
      if (count = options.delete(:count))
        list.sample(count, random: FFaker::Random)
      else
        list.sample(random: FFaker::Random)
      end
    end

    # Performs same action as as `Array#suffle` (returns a randomly-reordered
    # copy of `list`) except that it uses the internal Random Number Generator
    # so that the results are deterministic.
    def shuffle(list)
      list.shuffle(random: FFaker::Random)
    end
  end
end
