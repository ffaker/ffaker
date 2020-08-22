# frozen_string_literal: true

module FFaker
  module AddressUS
    include FFaker::Address

    extend ModuleUtils
    extend self

    ZIP_FORMATS = ['#####', '#####-####'].freeze
    CONTINENTAL_STATE = (STATE - %w[Hawaii Alaska])
    CONTINENTAL_STATE_ABBR = (STATE_ABBR - %w[HI AK])

    def zip_code
      FFaker.numerify(fetch_sample(ZIP_FORMATS))
    end

    def state
      fetch_sample(STATE)
    end

    def state_abbr(st_name = nil)
      return find_abbr(state) unless st_name

      st_name = capitalize_all_words(st_name)
      check_state_existence(st_name)
      find_abbr(st_name)
    end

    def state_and_territories_abbr
      fetch_sample(STATE_AND_TERRITORIES_ABBR)
    end

    def continental_state
      fetch_sample(CONTINENTAL_STATE)
    end

    def continental_state_abbr
      fetch_sample(CONTINENTAL_STATE_ABBR)
    end

    private

    def check_state_existence(state_name)
      return if STATE.include?(state_name)

      raise ArgumentError, "Unexpected state name: '#{state_name}'"
    end

    def find_abbr(state)
      STATE_ABBR[STATE.index(state)]
    end

    def capitalize_all_words(string)
      string.split.map(&:capitalize).join(' ')
    end
  end
end
