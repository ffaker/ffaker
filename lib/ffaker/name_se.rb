# encoding: utf-8

module Faker
  module NameSE
    include Faker::Name
    extend ModuleUtils
    extend self

    def name
      case rand(30)
      when 0 then "#{prefix} #{first_name} #{last_name}"
      else        "#{first_name} #{last_name}"
      end
    end

    def first_name
      case rand(12)
      when 0..4  then first_name_female
      when 5..9  then first_name_male
      when 10    then "#{first_name_male} #{first_name_male}"
      when 11    then "#{first_name_female} #{first_name_female}"
      else            first_name_female
      end
    end

    def first_name_female
      FIRST_NAMES_FEMALE.rand
    end

    def first_name_male
      FIRST_NAMES_MALE.rand
    end

    def last_name
      LAST_NAMES.rand
    end

    def prefix
      PREFIXES.rand
    end

    FIRST_NAMES_FEMALE = k %w(Maria Elisabeth Anna Kristina Margareta Eva
                              Birgitta Karin Linnéa Marie Ingrid Marianne
                              Sofia Kerstin Lena Helena Inger Sara Katarina
                              Johanna Emma Viktoria Cecilia Monica Ingegerd
                              Irene Susanne Anita Ulla Jenny Elin Therese
                              Viola Carina Louise Gunilla Hanna Ann Helen
                              Linda Annika Malin Ida Ulrika Barbro Matilda
                              Anette Josefin Elsa Siv Sofie Anneli Astrid
                              Caroline Britt Kristin Åsa Rut Karolina Lisa
                              Yvonne Emelie Gun Camilla Agneta Madeleine
                              Erika Alice Julia Amanda Charlotte Berit Lovisa
                              Inga Ingeborg Sandra Ann-Marie Frida Rebecka
                              Birgit Märta Charlotta Ellinor Jessica
                              Alexandra Britta Sonja Maja Gunnel Maj
                              Ann-Christin Isabelle Emilia Solveig Ellen
                              Lisbeth Ebba Pia Gerd Mona Ann-Marie Ann-Christin
                              Britt-Marie Maj-Britt Anna-Karin Ann-Charlotte
                              Ann-Sofie Ulla-Britt Marie-Louise Rose-Marie)

    FIRST_NAMES_MALE = k %w(Karl Erik Lars Anders Per Johan Mikael Olof Nils
                            Jan Lennart Gustav Hans Gunnar Peter Sven Fredrik
                            Bengt Thomas Bo Åke Göran Daniel Christer Oskar
                            Stefan Magnus Andreas Alexander Martin Mats Leif
                            John Bertil Mattias Arne Ulf Henrik Ingemar Björn
                            Jonas Stig Axel Robert Kjell Rolf Marcus Niklas
                            Christian Håkan David Patrik Viktor Rickard Emil
                            Christoffer Joakim Roland Tommy Vilhelm Ingvar
                            Claes Filip Roger William Kent Simon Ove Sebastian
                            Anton Kurt Rune Kenneth Tobias Johannes Jörgen
                            Mohammed Gösta Emanuel Jonathan Robin Jakob Georg
                            Sten Hugo Johnny Börje Alf Torbjörn Bernt Adam
                            Elias Allan Dan Linus Lucas Ola Jesper Henry Arvid
                            Jan-Erik Lars-Erik Per-Olof Karl-Erik Jan-Olof
                            Lars-Göran Sven-Erik Carl-Johan Per-Erik Lars-Olof)

    LAST_NAMES = k %w(Johansson Andersson Karlsson Nilsson Eriksson Larsson
                      Olsson Persson Svensson Gustafsson Pettersson Jonsson
                      Jansson Hansson Bengtsson Jönsson Lindberg Jakobsson
                      Magnusson Olofsson Lindström Lindqvist Lindgren Axelsson
                      Berg Lundberg Bergström Lundgren Mattsson Lundqvist Lind
                      Berglund Fredriksson Sandberg Henriksson Forsberg Sjöberg
                      Danielsson Håkansson Wallin Engström Eklund Lundin
                      Gunnarsson Fransson Samuelsson Holm Bergman Björk
                      Wikström Isaksson Bergqvist Arvidsson Nyström Holmberg
                      Löfgren Claesson Söderberg Nyberg Blomqvist Mårtensson
                      Nordström Lundström Pålsson Eliasson Björklund Viklund
                      Berggren Sandström Nordin Lund Ström Hermansson Åberg
                      Ekström Holmgren Sundberg Hedlund Dahlberg Hellström
                      Sjögren Abrahamsson Martinsson Andreasson Falk Öberg
                      Månsson Blom Ek Åkesson Strömberg Jonasson Norberg Hansen
                      Sundström Åström Holmqvist Ivarsson Lindholm Sundqvist)

    PREFIXES = k %w(Dr. Prof.)

  end
end
