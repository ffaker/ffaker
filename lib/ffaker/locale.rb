# encoding: utf-8

module FFaker
  module Locale
    extend ModuleUtils
    extend self

    def code(given_language = nil)
      code_index = LANGUAGE.index(given_language)
      if given_language && code_index
        LANGUAGE_CODE[code_index]
      else
        fetch_sample(LANGUAGE_CODE)
      end
    end

    def language(given_code = nil)
      language_index = LANGUAGE_CODE.index(given_code && given_code.upcase)
      if given_code && language_index
        LANGUAGE[language_index]
      else
        fetch_sample(LANGUAGE)
      end
    end
  end
end
