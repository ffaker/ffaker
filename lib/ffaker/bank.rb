# frozen_string_literal: true

module FFaker
  module Bank
    extend ModuleUtils
    extend self

    COUNTRIES = {
      'AA' => 'AL##########################', # Albania
      'AD' => 'AD######################', # Andorra
      'AT' => 'AT##################', # Austria
      'AZ' => 'AZ##????####################', # Azerbaijan
      'BH' => 'BH##????##############', # Bahrain
      'BY' => 'BY##????####################', # Belarus
      'BE' => 'BE##############', # Belgium
      'BA' => 'BA##################', # Bosnia and Herzegovina
      'BR' => 'BR#########################P#', # Brazil
      'BG' => 'BG##????##############', # Bulgaria
      'CR' => 'CR####################', # Costa Rica
      'HR' => 'HR###################', # Croatia
      'CY' => 'CY##########################', # Cyprus
      'CZ' => 'CZ######################', # Czech Republic
      'DK' => 'DK################', # Denmark
      'DO' => 'DO##????####################', # Dominican Republic
      'SV' => 'SV##????####################', # El Salvador
      'EE' => 'EE##################', # Estonia
      'FO' => 'FO################', # Faroe Islands
      'FI' => 'FI################', # Finland
      'FR' => 'FR#########################', # France
      'GE' => 'GE##??################', # Georgia
      'DE' => 'DE####################', # Germany
      'GI' => 'GI##????###############', # Gibraltar
      'GR' => 'GR#########################', # Greece
      'GL' => 'GL################', # Greenland
      'GT' => 'GT##AGRO####################', # Guatemala
      'VA' => 'VA####################', # Holy See
      'HU' => 'HU##########################', # Hungary
      'IS' => 'IS########################', # Iceland
      'IQ' => 'IQ##????###############', # Iraq
      'IE' => 'IE##????##############', # Ireland
      'IL' => 'IL#####################', # Israel
      'IT' => 'IT##X######################', # Italy
      'JO' => 'JO##????######################', # Jordan
      'KZ' => 'KZ##################', # Kazakhstan
      'XK' => 'XK##################', # Kosovo
      'KW' => 'KW##????######################', # Kuwait
      'LV' => 'LV##????#############', # Latvia
      'LB' => 'LB##########################', # Lebanon
      'LI' => 'LI###################', # Liechtenstein
      'LT' => 'LT##################', # Lithuania
      'LU' => 'LU##################', # Luxembourg
      'MT' => 'MT##MALT#######################', # Malta
      'MR' => 'MR#########################', # Mauritania
      'MU' => 'MU##????###################MUR', # Mauritius
      'MD' => 'MD##??##################', # Moldova
      'MC' => 'MC#########################', # Monaco
      'ME' => 'ME####################', # Montenegro
      'NL' => 'NL##????##########', # Netherlands
      'MK' => 'MK#################', # North Macedonia
      'NO' => 'NO#############', # Norway
      'PK' => 'PK##????################', # Pakistan
      'PS' => 'PS##PALS#####################', # Palestine
      'PL' => 'PL##########################', # Poland
      'PT' => 'PT#######################', # Portugal
      'QA' => 'QA##????#####################', # Qatar
      'RO' => 'RO##????################', # Romania
      'LC' => 'LC##????########################', # Saint Lucia
      'SM' => 'SM##P######################', # San Marino
      'ST' => 'ST#######################', # Sao Tome and Principe
      'SA' => 'SA######################', # Saudi Arabia
      'RS' => 'RS####################', # Serbia
      'SC' => 'SC##????####################USD', # Seychelles
      'SK' => 'SK######################', # Slovak Republic
      'SI' => 'SI#################', # Slovenia
      'ES' => 'ES######################', # Spain
      'SE' => 'SE######################', # Sweden
      'CH' => 'CH###################', # Switzerland
      'TL' => 'TL#####################', # Timor-Leste
      'TN' => 'TN######################', # Tunisia
      'TR' => 'TR########################', # Turkey
      'UA' => 'UA###########################', # Ukraine
      'AE' => 'AE#####################', # United Arab Emirates
      'GB' => 'GB##????##############', # United Kingdom
      'VG' => 'VG##????################' # Virgin Islands, British
    }.freeze

    def iban(country_code: nil)
      return formatify_iban(fetch_sample(COUNTRIES.values)) unless country_code

      check_country_existence(country_code)
      formatify_iban(COUNTRIES[country_code.upcase])
    end

    def card_number
      FFaker.numerify('#### #### #### ####')
    end

    def card_expiry_date(year_range: 5, year_latest: -5, format: '%m/%y')
      FFaker::Time.date({ year_range: year_range, year_latest: year_latest }).strftime(format)
    end

    def card_type
      fetch_sample(CARD_TYPES)
    end

    private

    def formatify_iban(code)
      FFaker.bothify(code).upcase
    end

    def check_country_existence(country_code)
      return if COUNTRIES.keys.include?(country_code.upcase)

      raise ArgumentError, "Unexpected country code: '#{country_code}'"
    end
  end
end
