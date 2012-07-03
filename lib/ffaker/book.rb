module Faker
  module Book
    extend ModuleUtils
    extend self

    def isbn10
      isbn = ""
      (1..10).each do |i|
        isbn += Kernel.rand(10).to_s
      end
      return isbn
    end

    def isbn13
      return "978#{isbn10}"
    end

    def isbn10_with_dashes
      isbn = isbn10
      "#{isbn[0]}-#{isbn[1..4]}-#{isbn[5..8]}-#{isbn[9]}"
    end

    def isbn13_with_dashes
      isbn = isbn13
      "#{isbn[0..2]}-#{isbn[3]}-#{isbn[4..7]}-#{isbn[8..11]}-#{isbn[12]}"
    end
  end
end
