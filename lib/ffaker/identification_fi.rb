# frozen_string_literal: true

module FFaker
  module IdentificationFI
    extend ModuleUtils
    extend self

    CHECK_DIGITS = '0123456789ABCDEFHJKLMNPRSTUVWXY'
    # Number ranges in real use
    POSSIBLY_REAL_FEMALE_INDIVIDUAL_NUMBERS = (2..898).step(2).to_a.freeze
    POSSIBLY_REAL_MALE_INDIVIDUAL_NUMBERS = (3..899).step(2).to_a.freeze
    # Number ranges not in real use
    FAKE_FEMALE_INDIVIDUAL_NUMBERS = (900..998).step(2).to_a.freeze
    FAKE_MALE_INDIVIDUAL_NUMBERS = (901..999).step(2).to_a.freeze

    def identity_number(gender: FFaker::Gender.binary, birthday: FFaker::Date.birthday, fake: true)
      day = fetch_formatted_day(birthday)
      month = fetch_formatted_month(birthday)
      year = fetch_formatted_year(birthday)
      separator = fetch_separator(birthday)
      individual_number = fetch_individual_number(gender, fake)
      check_digit = calculate_check_digit(birthday, individual_number)
      "#{day}#{month}#{year}#{separator}#{individual_number}#{check_digit}"
    end

    private

    def fetch_formatted_day(birthday)
      format('%.2d', birthday.day)
    end

    def fetch_formatted_month(birthday)
      format('%.2d', birthday.month)
    end

    def fetch_formatted_year(birthday)
      check_birth_year(birthday.year)
      birthday.strftime('%y')
    end

    def fetch_separator(birthday)
      case birthday.year
      when ..1899
        '+'
      when 1900..1999
        '-'
      else
        'A'
      end
    end

    def fetch_individual_number(gender, fake)
      numbers_range = if gender == 'female'
                        fake ? FAKE_FEMALE_INDIVIDUAL_NUMBERS : POSSIBLY_REAL_FEMALE_INDIVIDUAL_NUMBERS
                      else
                        fake ? FAKE_MALE_INDIVIDUAL_NUMBERS : POSSIBLY_REAL_MALE_INDIVIDUAL_NUMBERS
                      end
      format('%.3d', fetch_sample(numbers_range))
    end

    def calculate_check_digit(birthday, individual_number)
      digit = "#{birthday.day}#{fetch_formatted_month(birthday)}#{fetch_formatted_year(birthday)}#{individual_number}"
              .to_i % 31
      CHECK_DIGITS[digit]
    end

    def check_birth_year(birth_year)
      return if birth_year.between?(1799, 2100)

      raise ArgumentError, "Birth year: #{birth_year} is not between supported 1799 and 2100 range"
    end
  end
end
