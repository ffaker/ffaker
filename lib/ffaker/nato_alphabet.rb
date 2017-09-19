# encoding: utf-8

module FFaker
  module NatoAlphabet
    extend ModuleUtils
    extend self

    ALPHABET_CODES = %w[ALPHA BRAVO CHARLIE DELTA ECHO FOXTROT GOLF HOTEL INDIA JULIETT KILO LIMA MIKE NOVEMBER OSCAR PAPA QUEBEC ROMEO SIERRA TANGO UNIFORM VICTOR WHISKEY XRAY YANKEE ZULU].freeze
    NUMERIC_CODES = %w[ONE TWO THREE FOUR FIVE SIX SEVEN EIGHT NINE ZERO].freeze
    STOP_CODE = 'STOP'.freeze
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
