# frozen_string_literal: true

module FFaker
  # Inspirations:
  # https://pl.wikipedia.org/wiki/Kategoria:Dyscypliny_sportowe
  # https://pl.wikipedia.org/wiki/Igrzyska_olimpijskie
  module SportPL
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
