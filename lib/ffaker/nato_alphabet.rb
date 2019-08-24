# frozen_string_literal: true

module FFaker
  module NatoAlphabet
    extend ModuleUtils
    extend self

    STOP_CODE = 'STOP'
    CODES = ALPHABET_CODES + NUMERIC_CODES + [STOP_CODE]

    def code
      fetch_sample(CODES)
    end

    def alphabetic_code
      fetch_sample(ALPHABET_CODES)
    end

    def numeric_code
      fetch_sample(NUMERIC_CODES)
    end

    def callsign
      codify('?-?-#')
    end

    def codify(masks)
      masks.scan(/./).map do |c|
        case c
        when '#' then fetch_sample(NUMERIC_CODES)
        when '?' then fetch_sample(ALPHABET_CODES)
        when '.' then STOP_CODE
        else c
        end
      end.join
    end
  end
end
