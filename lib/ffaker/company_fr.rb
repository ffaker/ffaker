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

    # Get a random French SIREN number. See more here https://fr.wikipedia.org/wiki/Syst%C3%A8me_d%27identification_du_r%C3%A9pertoire_des_entreprises
    def siren
      base = FFaker.numerify('########')
      base + luhn_check(base).to_s
    end

    # Produces a company french siret number.
    def siret
      location = rand(0..99).to_s.rjust(4, '0')
      org_no = siren + location
      org_no + luhn_check(org_no).to_s
    end
  end
end
