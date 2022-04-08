# frozen_string_literal: true

module FFaker
  module Vehicle
    module VIN
      extend ModuleUtils
      extend self

      # https://en.wikibooks.org/wiki/Vehicle_Identification_Numbers_(VIN_codes)/World_Manufacturer_Identifier_(WMI)
      VALID_WMI_REGIONS = [*'A'..'C', *'J'..'Z', *'1'..'9'].freeze

      VALID_YEAR_CHARS = %w[
        5 6 7 8 9 A B C D E F G H J K L M N P R S T V W X Y 1 2 3 4 5 6 7 8 9
      ].freeze # 2005-2039

      # https://en.wikibooks.org/wiki/Vehicle_Identification_Numbers_(VIN_codes)/Check_digit
      TRANSLITERATION_VALUES = {
        'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8,
        'J' => 1, 'K' => 2, 'L' => 3, 'M' => 4, 'N' => 5, 'P' => 7, 'R' => 9,
        'S' => 2, 'T' => 3, 'U' => 4, 'V' => 5, 'W' => 6, 'X' => 7, 'Y' => 8, 'Z' => 9
      }.freeze
      POSITION_WEIGHTS = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2].freeze

      VALID_ALPHA = TRANSLITERATION_VALUES.keys
      VALID_ALPHANUMERIC = [*VALID_ALPHA, *'1'..'9'].freeze

      # Generate a VIN that is compliant with specifications of US Title 49 Section 565.15
      # https://www.govinfo.gov/content/pkg/CFR-2019-title49-vol6/xml/CFR-2019-title49-vol6-part565.xml#seqnum565.15
      #
      # Position  Meaning
      # 1-3       Manufacturer ID aka WMI (alpha and digits)
      # 4-8       Vehicle Description ("For passenger cars ..[position 7].. shall be alphabetic")
      # 9         Check Digit (0-9 or "X")
      # 10        Year (see VIN_VALID_YEARS)
      # 11        Plant of manufacture (alpha and digits)
      # 12-17     Serial number (digits only)
      #
      # I, O and Q are NOT allowed. VIN_VALID_ALPHA has valid alpha characters.
      def vin
        generated_vin = [
          # Manufacturer ID / WMI
          fetch_sample(VALID_WMI_REGIONS),
          fetch_sample(VALID_ALPHANUMERIC, count: 2),
          # Vehicle Description
          fetch_sample(VALID_ALPHANUMERIC, count: 3),
          fetch_sample(VALID_ALPHA),
          fetch_sample(VALID_ALPHANUMERIC),
          '0', # check digit placeholder
          fetch_sample(VALID_YEAR_CHARS), # Year of Manufacture
          fetch_sample(VALID_ALPHANUMERIC), # Plant ID
          FFaker.numerify('######') # Serial Number
        ].join

        # Calculate the Check Digit
        weighted_sum = generated_vin.chars.each_with_index.sum do |char, idx|
          (TRANSLITERATION_VALUES[char.to_sym] || char).to_i * POSITION_WEIGHTS[idx]
        end

        check_digit = weighted_sum % 11
        check_digit = 'X' if check_digit == 10
        generated_vin[8] = check_digit.to_s

        generated_vin
      end
    end

    extend ModuleUtils
    extend self

    DRIVETRAINS = %w[4WD 4X4 AWD FWD RWD].freeze
    YEARS = Array('1900'..(::Time.now.year + 1).to_s).freeze
    TRANSMISSIONS_ABBR = %w[AT MT AM CVT].freeze
    CYLINDERS = %w[2 5 6 8].freeze

    def base_color
      FFaker::Color.name
    end

    def drivetrain
      fetch_sample(DRIVETRAINS)
    end

    def make
      fetch_sample(MAKES_LIST)
    end

    def manufacturer_color(count = 2)
      # Take two prefixes because it's more fun than one
      (fetch_sample(COLOR_PREFIXES, count: count) + [base_color]).join(' ')
    end
    alias mfg_color manufacturer_color

    def model
      fetch_sample(MODELS_LIST)
    end

    def trim
      fetch_sample(TRIMS_LIST)
    end

    def vin
      VIN.vin
    end

    def year
      fetch_sample(YEARS)
    end

    def transmission
      fetch_sample(TRANSMISSIONS_LIST)
    end

    def transmission_abbr
      fetch_sample(TRANSMISSIONS_ABBR)
    end

    def engine_cylinders
      fetch_sample(CYLINDERS)
    end

    def engine_displacement
      fetch_sample(DISPLACEMENTS_LIST)
    end

    def fuel_type
      fetch_sample(FUEL_TYPES_LIST)
    end

    def interior_upholstery
      fetch_sample(UPHOLSTERY_LIST)
    end
  end
end
