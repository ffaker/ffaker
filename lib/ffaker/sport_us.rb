# frozen_string_literal: true

module FFaker
  module SportUS
    extend ModuleUtils
    extend self

    def name
      fetch_sample(NAMES)
    end
  end
end
