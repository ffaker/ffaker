require 'ffaker/utils/array_utils'

module Faker
  module ModuleUtils
    def k(arg)
      Faker::ArrayUtils.const_array(arg)
    end
  end
end
