# frozen_string_literal: true

module FFaker
  # Inspirations:
  # https://www.ekologia.pl/wiedza/zwierzeta/
  module AnimalPL
    extend ModuleUtils

    module_function

    def common_name
      fetch_sample(COMMON_NAMES)
    end
  end
end
