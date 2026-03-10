# frozen_string_literal: true

module FFaker
  module Device
    extend ModuleUtils
    extend self

    def name
      fetch_sample(NAME)
    end

    def manufacturer
      fetch_sample(MANUFACTURER)
    end

    def platform
      fetch_sample(PLATFORM)
    end

    def version
      "#{rand(10..17)}.#{rand(0..5)}"
    end

    def app_version
      "#{rand(1..5)}.#{rand(0..9)}.#{rand(0..9)}"
    end
  end
end
