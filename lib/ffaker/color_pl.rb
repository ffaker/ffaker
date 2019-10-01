# frozen_string_literal: true

module FFaker
  # Inspiration:
  # https://pl.wikipedia.org/wiki/Lista_kolor%C3%B3w
  module ColorPL
    extend ModuleUtils
    extend self

    def name
      fetch_sample(NAMES_LIST)
    end
  end
end
