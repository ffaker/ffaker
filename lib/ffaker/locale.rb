# encoding: utf-8

module Faker
  module Locale
    extend ModuleUtils
    extend self

    def code(given_language = nil)
      code_index = LANGUAGE.index(given_language)
      if given_language && code_index
        LANGUAGE_CODE[code_index]
      else
        LANGUAGE_CODE.sample
      end
    end

    def language(given_code = nil)
      language_index = LANGUAGE_CODE.index(given_code.upcase)
      if given_code && language_index
        LANGUAGE[language_index]
      else
        LANGUAGE.sample
      end
    end

  end
end
