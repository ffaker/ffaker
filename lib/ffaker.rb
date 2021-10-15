# frozen_string_literal: true

module FFaker
  require_relative 'ffaker/utils/array_utils'
  require_relative 'ffaker/utils/module_utils'

  extend ModuleUtils

  BASE_LIB_PATH = File.expand_path(__dir__)

  LETTERS = Array('a'..'z').freeze

  HEX = %w[0 1 2 3 4 5 6 7 8 9 A B C D E F].freeze

  def self.hexify(*masks)
    fetch_sample(masks.flatten).gsub(/#/) { fetch_sample(HEX) }
  end

  def self.numerify(*masks)
    fetch_sample(masks.flatten).gsub(/#/) { rand(0..9).to_s }
  end

  def self.letterify(*masks)
    fetch_sample(masks.flatten).gsub(/\?/) { fetch_sample(LETTERS) }
  end

  def self.bothify(masks)
    letterify(numerify(masks))
  end

  autoload :Address, 'ffaker/address'
  autoload :AddressAU, 'ffaker/address_au'
  autoload :AddressBR, 'ffaker/address_br'
  autoload :AddressCA, 'ffaker/address_ca'
  autoload :AddressCH, 'ffaker/address_ch'
  autoload :AddressCHDE, 'ffaker/address_ch_de'
  autoload :AddressCHFR, 'ffaker/address_ch_fr'
  autoload :AddressCHIT, 'ffaker/address_ch_it'
  autoload :AddressDA, 'ffaker/address_da'
  autoload :AddressDE, 'ffaker/address_de'
  autoload :AddressFI, 'ffaker/address_fi'
  autoload :AddressFR, 'ffaker/address_fr'
  autoload :AddressGR, 'ffaker/address_gr'
  autoload :AddressID, 'ffaker/address_id'
  autoload :AddressIN, 'ffaker/address_in'
  autoload :AddressIT, 'ffaker/address_it'
  autoload :AddressJA, 'ffaker/address_ja'
  autoload :AddressKR, 'ffaker/address_kr'
  autoload :AddressMX, 'ffaker/address_mx'
  autoload :AddressNL, 'ffaker/address_nl'
  autoload :AddressPL, 'ffaker/address_pl'
  autoload :AddressRU, 'ffaker/address_ru'
  autoload :AddressSE, 'ffaker/address_se'
  autoload :AddressSN, 'ffaker/address_sn'
  autoload :AddressUA, 'ffaker/address_ua'
  autoload :AddressUK, 'ffaker/address_uk'
  autoload :AddressUS, 'ffaker/address_us'
  autoload :Airline, 'ffaker/airline'
  autoload :Animal, 'ffaker/animal'
  autoload :AnimalBR, 'ffaker/animal_br'
  autoload :AnimalCN, 'ffaker/animal_cn'
  autoload :AnimalES, 'ffaker/animal_es'
  autoload :AnimalPL, 'ffaker/animal_pl'
  autoload :AnimalUS, 'ffaker/animal_us'
  autoload :Avatar, 'ffaker/avatar'
  autoload :AWS, 'ffaker/aws'
  autoload :BaconIpsum, 'ffaker/bacon_ipsum'
  autoload :Bank, 'ffaker/bank'
  autoload :Book, 'ffaker/book'
  autoload :Boolean, 'ffaker/boolean'
  autoload :CheesyLingo, 'ffaker/cheesy_lingo'
  autoload :Code, 'ffaker/code'
  autoload :Color, 'ffaker/color'
  autoload :ColorPL, 'ffaker/color_pl'
  autoload :ColorUA, 'ffaker/color_ua'
  autoload :Company, 'ffaker/company'
  autoload :CompanyCN, 'ffaker/company_cn'
  autoload :CompanyFR, 'ffaker/company_fr'
  autoload :CompanyIT, 'ffaker/company_it'
  autoload :CompanyJA, 'ffaker/company_ja'
  autoload :CompanySE, 'ffaker/company_se'
  autoload :Conference, 'ffaker/conference'
  autoload :CoursesFR, 'ffaker/courses_fr'
  autoload :Currency, 'ffaker/currency'
  autoload :DizzleIpsum, 'ffaker/dizzle_ipsum'
  autoload :Education, 'ffaker/education'
  autoload :EducationCN, 'ffaker/education_cn'
  autoload :Filesystem, 'ffaker/filesystem'
  autoload :Food, 'ffaker/food'
  autoload :FoodPL, 'ffaker/food_pl'
  autoload :FreedomIpsum, 'ffaker/freedom_ipsum'
  autoload :Game, 'ffaker/game'
  autoload :Gender, 'ffaker/gender'
  autoload :GenderBR, 'ffaker/gender_br'
  autoload :GenderCN, 'ffaker/gender_cn'
  autoload :GenderID, 'ffaker/gender_id'
  autoload :GenderIT, 'ffaker/gender_it'
  autoload :GenderJA, 'ffaker/gender_ja'
  autoload :GenderJP, 'ffaker/gender_jp'
  autoload :GenderKR, 'ffaker/gender_kr'
  autoload :GenderPL, 'ffaker/gender_pl'
  autoload :GenderRU, 'ffaker/gender_ru'
  autoload :Geolocation, 'ffaker/geolocation'
  autoload :Guid, 'ffaker/guid'
  autoload :HealthcareIpsum, 'ffaker/healthcare_ipsum'
  autoload :HealthcareRU, 'ffaker/healthcare_ru'
  autoload :HipsterIpsum, 'ffaker/hipster_ipsum'
  autoload :HTMLIpsum, 'ffaker/html_ipsum'
  autoload :Identification, 'ffaker/identification'
  autoload :IdentificationBR, 'ffaker/identification_br'
  autoload :IdentificationES, 'ffaker/identification_es'
  autoload :IdentificationESCL, 'ffaker/identification_es_cl'
  autoload :IdentificationESCO, 'ffaker/identification_es_co'
  autoload :IdentificationIN, 'ffaker/identification_in'
  autoload :IdentificationIT, 'ffaker/identification_it'
  autoload :IdentificationKr, 'ffaker/identification_kr'
  autoload :IdentificationMX, 'ffaker/identification_mx'
  autoload :IdentificationPL, 'ffaker/identification_pl'
  autoload :IdentificationTW, 'ffaker/identification_tw'
  autoload :Image, 'ffaker/image'
  autoload :Internet, 'ffaker/internet'
  autoload :InternetSE, 'ffaker/internet_se'
  autoload :Job, 'ffaker/job'
  autoload :JobBR, 'ffaker/job_br'
  autoload :JobCN, 'ffaker/job_cn'
  autoload :JobFR, 'ffaker/job_fr'
  autoload :JobIT, 'ffaker/job_it'
  autoload :JobJA, 'ffaker/job_ja'
  autoload :JobKR, 'ffaker/job_kr'
  autoload :JobVN, 'ffaker/job_vn'
  autoload :Locale, 'ffaker/locale'
  autoload :Lorem, 'ffaker/lorem'
  autoload :LoremAR, 'ffaker/lorem_ar'
  autoload :LoremBR, 'ffaker/lorem_br'
  autoload :LoremCN, 'ffaker/lorem_cn'
  autoload :LoremFR, 'ffaker/lorem_fr'
  autoload :LoremIE, 'ffaker/lorem_ie'
  autoload :LoremIT, 'ffaker/lorem_it'
  autoload :LoremJA, 'ffaker/lorem_ja'
  autoload :LoremKR, 'ffaker/lorem_kr'
  autoload :LoremPL, 'ffaker/lorem_pl'
  autoload :LoremRU, 'ffaker/lorem_ru'
  autoload :LoremUA, 'ffaker/lorem_ua'
  autoload :Movie, 'ffaker/movie'
  autoload :Music, 'ffaker/music'
  autoload :Name, 'ffaker/name'
  autoload :NameAR, 'ffaker/name_ar'
  autoload :NameBR, 'ffaker/name_br'
  autoload :NameCN, 'ffaker/name_cn'
  autoload :NameCS, 'ffaker/name_cs'
  autoload :NameDA, 'ffaker/name_da'
  autoload :NameDE, 'ffaker/name_de'
  autoload :NameES, 'ffaker/name_es'
  autoload :NameFR, 'ffaker/name_fr'
  autoload :NameGA, 'ffaker/name_ga'
  autoload :NameGR, 'ffaker/name_gr'
  autoload :NameID, 'ffaker/name_id'
  autoload :NameIN, 'ffaker/name_in'
  autoload :NameIT, 'ffaker/name_it'
  autoload :NameJA, 'ffaker/name_ja'
  autoload :NameKH, 'ffaker/name_kh'
  autoload :NameKR, 'ffaker/name_kr'
  autoload :NameMX, 'ffaker/name_mx'
  autoload :NameNB, 'ffaker/name_nb'
  autoload :NameNL, 'ffaker/name_nl'
  autoload :NamePH, 'ffaker/name_ph'
  autoload :NamePL, 'ffaker/name_pl'
  autoload :NameRU, 'ffaker/name_ru'
  autoload :NameSE, 'ffaker/name_se'
  autoload :NameSN, 'ffaker/name_sn'
  autoload :NameTH, 'ffaker/name_th'
  autoload :NameTW, 'ffaker/name_tw'
  autoload :NameTHEN, 'ffaker/name_th_en'
  autoload :NameUA, 'ffaker/name_ua'
  autoload :NameVN, 'ffaker/name_vn'
  autoload :NatoAlphabet, 'ffaker/nato_alphabet'
  autoload :Number, 'ffaker/number'
  autoload :PhoneNumber, 'ffaker/phone_number'
  autoload :PhoneNumberAU, 'ffaker/phone_number_au'
  autoload :PhoneNumberBR, 'ffaker/phone_number_br'
  autoload :PhoneNumberCH, 'ffaker/phone_number_ch'
  autoload :PhoneNumberCU, 'ffaker/phone_number_cu'
  autoload :PhoneNumberDA, 'ffaker/phone_number_da'
  autoload :PhoneNumberDE, 'ffaker/phone_number_de'
  autoload :PhoneNumberFR, 'ffaker/phone_number_fr'
  autoload :PhoneNumberID, 'ffaker/phone_number_id'
  autoload :PhoneNumberIT, 'ffaker/phone_number_it'
  autoload :PhoneNumberJA, 'ffaker/phone_number_ja'
  autoload :PhoneNumberKR, 'ffaker/phone_number_kr'
  autoload :PhoneNumberMX, 'ffaker/phone_number_mx'
  autoload :PhoneNumberNL, 'ffaker/phone_number_nl'
  autoload :PhoneNumberPL, 'ffaker/phone_number_pl'
  autoload :PhoneNumberSE, 'ffaker/phone_number_se'
  autoload :PhoneNumberSG, 'ffaker/phone_number_sg'
  autoload :PhoneNumberSN, 'ffaker/phone_number_sn'
  autoload :PhoneNumberTW, 'ffaker/phone_number_tw'
  autoload :PhoneNumberUA, 'ffaker/phone_number_ua'
  autoload :PhoneNumberRU, 'ffaker/phone_number_ru'
  autoload :Product, 'ffaker/product'
  autoload :SemVer, 'ffaker/sem_ver'
  autoload :Skill, 'ffaker/skill'
  autoload :Sport, 'ffaker/sport'
  autoload :SportPL, 'ffaker/sport_pl'
  autoload :SportUS, 'ffaker/sport_us'
  autoload :SportRU, 'ffaker/sport_ru'
  autoload :SSN, 'ffaker/ssn'
  autoload :SSNMX, 'ffaker/ssn_mx'
  autoload :SSNSE, 'ffaker/ssn_se'
  autoload :String, 'ffaker/string'
  autoload :Time, 'ffaker/time'
  autoload :Tweet, 'ffaker/tweet'
  autoload :Unit, 'ffaker/unit'
  autoload :UnitEnglish, 'ffaker/unit_english'
  autoload :UnitMetric, 'ffaker/unit_metric'
  autoload :VERSION, 'version'
  autoload :Vehicle, 'ffaker/vehicle'
  autoload :Venue, 'ffaker/venue'
  autoload :Youtube, 'ffaker/youtube'

  # Random Number Generator (RNG) used with ModuleUtils#fetch, #shuffle, #rand
  # in order to provide deterministic repeatability.
  module Random
    # Returns the current RNG seed.
    def self.seed
      @seed ||= ::Random.new_seed
    end

    # Sets the RNG seed and creates a new internal RNG.
    def self.seed=(new_seed)
      @seed = new_seed
      reset!
      new_seed
    end

    # Reset the RNG back to its initial state.
    def self.reset!
      @rng = new_rng
    end

    # Returns a random number using an RNG with a known seed.
    def self.rand(max = nil)
      return rng.rand(max) if max

      rng.rand
    end

    # Returns the current Random object.
    def self.rng
      @rng ||= new_rng
    end

    # Returns a new Random object instantiated with #seed.
    def self.new_rng
      ::Random.new(seed)
    end
  end
end
