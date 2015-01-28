# encoding: utf-8

module Faker
  module NatoAlphabet
    extend ModuleUtils
    extend self

    ALPHABET_CODES = %w(ALPHA BRAVO CHARLIE DELTA ECHO FOXTROT GOLF HOTEL INDIA JULIETT KILO LIMA MIKE NOVEMBER OSCAR PAPA QUEBEC ROMEO SIERRA TANGO UNIFORM VICTOR WHISKEY XRAY YANKEE ZULU)
    NUMERIC_CODES = %w(ONE TWO THREE FOUR FIVE SIX SEVEN EIGHT NINE ZERO)
    STOP_CODE = "STOP"
    CODES = ALPHABET_CODES + NUMERIC_CODES + [STOP_CODE]

    def code
      CODES.sample
    end

    def alphabetic_code
      ALPHABET_CODES.sample
    end

    def numeric_code
      NUMERIC_CODES.sample
    end

    def callsign
      codify("?-?-#")
    end

    def codify(masks)
      masks.scan(/./).map do |c|
        case c
        when "#" then NUMERIC_CODES.sample
        when "?" then ALPHABET_CODES.sample
        when "." then STOP_CODE
        else c
        end
      end.join
    end
  end
end
