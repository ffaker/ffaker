# frozen_string_literal: true

module FFaker
  module Animal
    extend ModuleUtils
    extend self

    # @deprecated US animals name. Moved into {AnimalUS}
    def common_name
      warn '[common_name] is deprecated. For animal name in english please use the AnimalUS module'
      fetch_sample(COMMON_NAMES)
    end
  end
end
