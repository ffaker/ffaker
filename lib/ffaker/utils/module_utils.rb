require 'ffaker/utils/array_utils'
require 'ffaker/utils/random_utils'
require 'ffaker/utils/unique_utils'

module FFaker
  module ModuleUtils
    include RandomUtils

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

    def unique(max_retries = 10_000)
      @unique_generator ||= FFaker::UniqueUtils.new(self, max_retries)
    end
  end
end
