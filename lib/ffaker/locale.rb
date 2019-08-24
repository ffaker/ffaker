# frozen_string_literal: true

module FFaker
  module Locale
    extend ModuleUtils
    extend self

    def code(given_language = nil)
      code_index = LANGUAGE.index(given_language)
      return LANGUAGE_CODE[code_index] if given_language && code_index

      fetch_sample(LANGUAGE_CODE)
    end

    def language(given_code = nil)
      language_index = LANGUAGE_CODE.index(given_code&.upcase)
      return LANGUAGE[language_index] if given_code && language_index

      fetch_sample(LANGUAGE)
    end
  end
end
