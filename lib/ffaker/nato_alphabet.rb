# encoding: utf-8

module Faker
  module NatoAlphabet
    extend ModuleUtils
    extend self

    ALPHABET_CODES = k %w(ALPHA BRAVO CHARLIE DELTA ECHO FOXTROT GOLF HOTEL INDIA JULIETT KILO LIMA MIKE NOVEMBER OSCAR PAPA QUEBEC ROMEO SIERRA TANGO UNIFORM VICTOR WHISKEY XRAY YANKEE ZULU)
    NUMERIC_CODES = k %w(ONE TWO THREE FOUR FIVE SIX SEVEN EIGHT NINE ZERO)
    STOP_CODE = "STOP"
    CODES = ALPHABET_CODES + NUMERIC_CODES + [STOP_CODE]

    def code
      ArrayUtils.rand(CODES)
    end

    def alphabetic_code
      ArrayUtils.rand(ALPHABET_CODES)
    end

    def numeric_code
      ArrayUtils.rand(NUMERIC_CODES)
    end

    def callsign
      codify("?-?-#")
    end

    def codify(masks)
      masks.scan(/./).map do |c|
        case c
        when "#" then NUMERIC_CODES.rand
        when "?" then ALPHABET_CODES.rand
        when "." then STOP_CODE
        else c
        end
      end.join
    end
  end
end
