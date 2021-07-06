# frozen_string_literal: true

module FFaker
  # Inspirations:
  # https://olympic.ru/team/sport/
  # http://ru.sport-wiki.org/vidy-sporta/
  module SportRU
    extend ModuleUtils
    extend self

    ALL = SUMMER + WINTER

    def name
      fetch_sample(ALL)
    end

    def summer
      fetch_sample(SUMMER)
    end

    def winter
      fetch_sample(WINTER)
    end
  end
end
