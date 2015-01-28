# encoding: utf-8

require 'date'

module Faker

  # The Social Security number is a 12-digit number in the format:
  # "YYYYDDMM-XXXX'
  #
  # http://sv.wikipedia.org/wiki/Personnummer_i_Sverige
  #
  # The 4 last digits (XXXX) are generated based on what region the person are
  # born # in, the gender and the last one is a check digit using the luhn
  # algorithm.
  #
  # http://en.wikipedia.org/wiki/Luhn_algorithm
  #
  # Usage:
  # ssn(from: Time.local(1980, 2, 28),
  #     to: Time.local(2000, 2, 28),
  #     gender: :male)
  #
  module SSNSE
    extend ModuleUtils
    extend self

    GENDERS = ["female", "male"]

    def ssn(opts = {})
      from   = opts[:from]   || ::Time.local(1940, 1, 1)
      to     = opts[:to]     || ::Time.now
      gender = (opts[:gender] || GENDERS.sample).to_s

      raise_error_on_bad_arguments(from, to, gender)

      generate_ssn(from, to, gender)
    end

    private

    def generate_ssn(from, to, gender)
      birth_date = random_birth_time_between(from, to)
      birth_date_str = birth_date.strftime("%Y%m%d")      # "19800228"
      region = get_random_region_for(gender)              # "413"
      ssn_without_check_digit = birth_date_str + region   # "19800228413"
      check_digit = luhn_check(ssn_without_check_digit)   # "9"
      ssn_without_check_digit + check_digit               # "198002284139"
    end

    def raise_error_on_bad_arguments(from, to, gender)
      raise ArgumentError, "Invalid from argument: from" unless to.is_a? ::Time
      raise ArgumentError, "Invalid from argument: from" unless from.is_a? ::Time
      raise ArgumentError, "Invalid argument: from > to" if from > to
      raise ArgumentError, "Invalid argument: gender" unless GENDERS.include?(gender.to_s)
    end

    def random_birth_time_between(from=::Time.local(1940, 1, 1), to=::Time.now)
      ::Time.at(from + rand * (to.to_f - from.to_f))
    end

    def get_random_region_for(gender)
      region_number = case gender
      when "female" then get_random_region_even
      when "male" then get_random_region_odd
      end
      three_character_string(region_number)
    end

    def get_random_region_even
      rand(499) * 2
    end

    def get_random_region_odd
      rand(499) * 2 + 1
    end

    def three_character_string(number)
      "%03d" % number
    end

    # http://en.wikipedia.org/wiki/Luhn_algorithm
    def luhn_check(number)
      multiplications = []

      number.split(//).each_with_index do |digit, i|
        if i % 2 == 0
          multiplications << digit.to_i * 2
        else
          multiplications << digit.to_i
        end
      end

      sum = 0
      multiplications.each do |num|
        num.to_s.each_byte do |character|
          sum += character.chr.to_i
        end
      end

      if sum % 10 == 0
        control_digit = 0
      else
        control_digit = (sum / 10 + 1) * 10 - sum
      end

      control_digit.to_s
    end
  end
end
