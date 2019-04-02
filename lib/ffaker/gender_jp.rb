# encoding: utf-8
# frozen_string_literal: true

module FFaker
  # Author Walerian Sobczak <walerian.sobczak@gmail.com> github.com/walerian777
  # Inspirations:
  # https://ja.wikipedia.org/wiki/%E6%80%A7_(%E7%94%9F%E7%89%A9%E5%AD%A6)
  module GenderJP
    extend ModuleUtils
    extend self

    GENDERS = %w[女 男].freeze

    def random
      fetch_sample(GENDERS)
    end

    alias maybe random
    alias sample random
  end
end
