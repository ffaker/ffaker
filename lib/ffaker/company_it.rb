# encoding: utf-8

module FFaker
  module CompanyIT
    extend ModuleUtils
    extend self

    PREFIXES = ['Studio Legale', 'Studio Tecnico', 'Laboratorio'].freeze
    SUFFIXES = %w[S.p.a. s.r.l. s.n.c. Avvocati Architetti Ingegneri].freeze

    def name
      case rand(0..2)
      when 0 then "#{NameIT.last_name} #{suffix}"
      when 1 then "#{NameIT.last_name} e #{NameIT.last_name} #{suffix}"
      when 2 then "#{prefix} #{NameIT.last_name}"
      end
    end

    def suffix
      fetch_sample(SUFFIXES)
    end

    def prefix
      fetch_sample(PREFIXES)
    end

    # Calculated using the algorithm at https://it.wikipedia.org/wiki/Partita_IVA
    # to return a valid Partita IVA (Italian VAT number)
    # @return a valid Italian VAT number (Partita IVA)
    def partita_iva
      matricola = Array.new(7) { rand(0..9) }
      office_code = fetch_sample(PIVA_OFFICE_CODES)
      base = matricola + office_code.chars.map(&:to_i)

      # Thanks https://stackoverflow.com/a/9189731/1627766
      sum = base.reverse.each_slice(2).flat_map { |x, y| [(x * 2).divmod(10), y || 0] }.flatten.reduce(:+)

      control_digit = (10 - (sum % 10)) % 10

      (base << control_digit).join
    end
  end
end
