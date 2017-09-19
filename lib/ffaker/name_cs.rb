# encoding: utf-8

require 'ffaker/name'

module FFaker
  module NameCS
    include FFaker::Name

    extend ModuleUtils
    extend self

    FIRST_NAMES = {
      female: %w[Alena Andrea Anna Barbora Božena Dagmar Dana Eliška Eva Hana Helena Irena Ivana Jana Jarmila Jaroslava Jiřina Jitka Kateřina Kristýna Lenka Libuše Lucie Ludmila Marcela Marie Markéta Marta Martina Michaela Miroslava Monika Pavla Petra Tereza Věra Veronika Vlasta Zdeňka Zuzana],
      male: %w[Adam Aleš Alexandr Alois Antonín Bedřich Bohumil Bohuslav Břetislav Dalibor Daniel David Denis Dominik Dušan Eduard Emil Filip František Ivan Ivo Jakub Jan Jaromír Jaroslav Jindřich Jiří Josef Jozef Kamil Karel Kryštof Ladislav Leoš Libor Lubomír Luboš Luděk Ludvík Lukáš Marcel Marek Marian Martin Matěj Matyáš Michael Michal Milan Miloslav Miloš Miroslav Oldřich Ondřej Otakar Patrik Pavel Petr Přemysl Radek Radim Radomír Radovan René Richard Robert Roman Rostislav Rudolf Samuel Stanislav Šimon Štefan Štěpán Tadeáš Tomáš Václav Viktor Vilém Vít Vítězslav Vladimír Vladislav Vlastimil Vojtěch Vratislav Zbyněk Zdeněk]
    }.freeze
    LAST_NAMES = {
      female: %w[Dvořáková Černá Benešová Fialová Doležalová Čermáková Blažková Bartošová Čechová Dostálová Bláhová Burešová Dušková Beranová Bednářová Bártová Fišerová Bílková Beránková Brožová Čížková Adámková Daňková Filipová Červenková Čapková Bendová Adamcová Dvořáčková Brabcová Davidová Březinová Dlouhá Dohnalová Burianová Dufková Fojtíková Burdová Červená Boháčová Bartoňová Doleželová Dudová Adamová Bauerová Divišová Coufalová Čejková Berková Balážová],
      male: %w[Dvořák Černý Beneš Fiala Doležal Čermák Blažek Bartoš Čech Dostál Bláha Bureš Dušek Beran Bednář Bárta Bílek Beránek Fišer Brož Čížek Filip Červenka Adámek Daněk Dvořáček Benda Adamec Brabec Březina David Burian Čapek Dohnal Dlouhý Fojtík Bartoň Červený Dufek Burda Duda Adam Boháč Doležel Baláž Diviš Coufal Bauer Dolejší]
    }.freeze
    SUFFIXES = %w[Ph.D. Th.D. DSc.].freeze
    GENDERS = %i[male female random].freeze # :nodoc:

    # All names generated inside the block will have the same sex.
    # Can be called with explicit sex which will affect
    # all calls inside thee block:
    #
    #   FFaker::NameCS.with_same_sex(:female)
    #     person.last_name  = FFaker::NameCS.last_name
    #     person.first_name = FFaker::NameCS.first_name
    #   end
    #
    #   person.last_name    # => "Nováková"
    #   person.first_name   # => "Jana"
    def with_same_sex(sex = :random)
      @fixed_sex = sex == :random ? GENDERS[rand(0..1)] : sex
      yield
    ensure
      @fixed_sex = nil
    end

    # Generates random full name which can contain prefix and suffix
    # Can be called with explicit sex (:male, :female), like:
    #
    #   FFaker::NameCS.name(:male)
    #
    # for_sex defaults to :random.
    def name(for_sex = :random)
      with_same_sex(for_sex) do
        case rand(0..9)
        when 0     then "#{prefix} #{first_name} #{last_name} #{suffix}"
        when 1..2  then "#{prefix} #{first_name} #{last_name}"
        else "#{first_name} #{last_name}"
        end
      end
    end

    # Generates random last name
    # for_sex can be :male, :female. Defaults to :random
    def last_name(for_sex = :random)
      fetch_sample(LAST_NAMES[select_sex(for_sex)])
    end

    # Generates random first name
    # for_sex can be :male, :female. Defaults to :random
    def first_name(for_sex = :random)
      fetch_sample(FIRST_NAMES[select_sex(for_sex)])
    end

    # Generates random name prefix, an academic degree
    def prefix
      fetch_sample(PREFIXES)
    end

    # Generates random name suffix, an academic degree
    def suffix
      fetch_sample(SUFFIXES)
    end

    private

    def select_sex(sex) # :nodoc:
      @fixed_sex ||= nil
      given_sex = @fixed_sex || sex
      raise ArgumentError, "Unknown sex #{given_sex}" \
        unless GENDERS.include?(given_sex)
      given_sex == :random ? GENDERS[rand(0..1)] : given_sex
    end
  end
end
