require 'ffaker/utils/array_utils'

module Faker
  module ModuleUtils
    def k(arg)
      Faker::ArrayUtils.const_array(arg)
    end

    def const_missing(const_name)
      mod_name = ancestors.first.to_s.split("::").last
      data_path = "#{Faker::DATA_PATH}/#{underscore(mod_name)}/#{underscore(const_name.to_s)}"
      data = File.read(data_path).split("\n")
      const_set const_name, k(data)
      data
    end

    def underscore(string)
      string.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end
  end
end
