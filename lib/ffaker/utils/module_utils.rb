require 'ffaker/utils/array_utils'

module FFaker
  module ModuleUtils
    def k(arg)
      FFaker::ArrayUtils.const_array(arg)
    end

    def const_missing(const_name)
      if const_name =~ /[a-z]/ # Not a constant, probably a class/module name.
        super const_name
      else
        mod_name = ancestors.first.to_s.split('::').last
        data_path = "#{FFaker::BASE_LIB_PATH}/ffaker/data/#{underscore(mod_name)}/#{underscore(const_name.to_s)}"
        data = k File.read(data_path).split("\n")
        const_set const_name, data
        data
      end
    end

    def underscore(string)
      string.gsub(/::/, '/')
            .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
            .gsub(/([a-z\d])([A-Z])/, '\1_\2')
            .tr('-', '_')
            .downcase
    end

    # Make calls to built-in `rand` function use `FFaker::Random.rand` instead.
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
    # copy of `list`) except that it uses a repeatable Random Number Generator
    # so that the results are deterministic.
    def shuffle(list)
      list.shuffle(random: FFaker::Random)
    end
  end
end
