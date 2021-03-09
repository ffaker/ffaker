# frozen_string_literal: true

module FFaker
  module CompanyFR
    extend ModuleUtils
    extend self

    SUFFIXES = %w[SA et\ fils SARL Groupe].freeze

    def name
      case rand(0..2)
      when 0 then "#{NameFR.last_name} #{suffix}"
      when 1 then "#{NameFR.last_name}-#{NameFR.last_name}"
      when 2 then format('%s, %s and %s', NameFR.last_name, NameFR.last_name, NameFR.last_name)
      end
    end

    def suffix
      fetch_sample(SUFFIXES)
    end

    ##
    # @faker.version 1.8.5
    # Get a random French SIREN number. See more here https://fr.wikipedia.org/wiki/Syst%C3%A8me_d%27identification_du_r%C3%A9pertoire_des_entreprises
    def french_siren_number
      base = (1..8).map { rand(10) }.join
      base + luhn_check(base).to_s
    end

    ##
    # @faker.version 1.8.5
    # Produces a company french siret number.
    def french_siret_number
      location = rand(100).to_s.rjust(4, '0')
      org_no = french_siren_number + location
      org_no + luhn_check(org_no).to_s
    end
  end
end
