# encoding: utf-8
# => author: guapolo github.com/guapolo
module Faker
  module NameMX
    include Faker::Name
    extend ModuleUtils
    extend self

    MALE_FIRST_NAMES = k %w(
      Aaron Abraham Adán Adolfo Adrián Agustín Alan Alberto Aldo Alejandro Alfonso Alonso Andrés Ángel Apolinar
      Armando Arturo Abel Adrián Antonio Ariel Arquímides Axel Aurelio Augusto Arnulfo Aníbal Anselmo Amado Amador
      Baltazar Benito Benjamin Benito Braulio Bruno Bernardo Benancio
      Carlos Carmelo César Christian Claudio Clemente Cosme Cuauhtemoc
      Daniel David Darío Diego Domingo Donato Demetrio
      Eder Edgar Eduardo Eliseo Erick Efraín Ezequiel Elías Elvis Emanuel Eugenio Emilio Emiliano Enrique Ernesto
      Fernando Francisco Fabián Florente Felipe Félix Francisco Fidel Feliciano Fausto Fabricio Fermín
      Gerardo Germán Gibrán Guadalupe Guillermo Gregorio Giovani Genaro Gil Gustavo Guillermo
      Hazael Héctor Hilario Herminio Horacio Hugo Humberto Heriberto Horacio Homero
      Ignacio Irving Isaac Ismael Igor Iván Israel Isidro
      Jesús Jaime Jerónimo Javier Jorge José Josué Juan Jacinto Jacobo Julián Joel Joaquín Juventino
      Kevin
      Leonardo León Luis Leonel Lino
      Manuel Marcel Miguel Marco Martín Mario Marcelo Marcelino Margarito Marvin Mauro Mauricio Maximiliano Moisés
      Nabor Néstor Nicanor Nicandro Norberto Nicolás Noé
      Odín Octavio Olaf Oscar Oliver Omar Otilio Oswaldo Osiel Orlando
      Pablo Pedro Patricio Pánfilo Pascual
      Quetzalcóatl
      Rafael Ramón Ricardo René Rigoberto Roberto Rodolfo Rodrigo Ramsés Rafael Raúl Román Rubén Roque Roger Rolando Rogelio
      Salvador Sebastián Santiago Sergio Samuel Saúl Silverio Silvio Simón Seferino
      Tomás Temístocles Teodoro
      Ubaldo Ulises Uriel
      Vicente Víctor Valentín Vladimir Victoriano
      Wilberto Wilfredo
      Xavier
      Yael Yordi Yoshio
      Zoé
    )

    FEMALE_FIRST_NAMES = k %w(Adriana Argelia Aida Aidee Alba Alejandra Alicia Ana América Anabel Andrea Anahí
      Araceli Angélica Ángela Aurora Abigail Abril Adelina Aidé Alma Alondra Amanda Anabel Azucena Aura Auréa
      Balbina Beatriz Brenda Blanca Bárbara Belén Benita Berenice Bertha Brenda Brianda
      Carla Catalina Cecilia Celia Cinthia Citlali Claudia Cristal Cristina Carolina Casandra Carmen Camila
      Clara Clementina Constanza
      Delia Dulce Diana Dania Daniela Dulce Denisse Dora
      Elba Elia Eréndira Eva Edith Elena Elia Elisa Elsa Elvira Emilia Emma Erica Esmeralda Eunice
      Fabiola Fátima Fernanda Fabiola Flor Frida Francisca
      Gabriela Georgina Gloria Geraldine Gina Guadalup Gladis
      Heidi Hanna Hilda Helena
      Iliana Imelda Irene Iris Iraida Ivette Ivonne Ingrid Iris Irma Isabel Itzel
      Jaqueline Juana Judith Jazmín Jezabel Jimena Josefina Jovana Julia
      Karla Katya Karen Karina
      Laura Leticia Lilia Liliana Lirio Lorena Lucero Luz Leslie Linda Luisa Lucía Lisette
      Marina Mariana María Margo Mayra Mayte Marisol Marisa Marcela Maricela Mariel Melina Miriam Montserrat Marcia
      Margarita Magali Mara Mirna Mónica Mayra Martha Marlene Matilde Marcia Marina
      Norma Nayeli Natalia Nancy Nadia Nohemí Norma Nuria Nadia
      Obdulia Olga Olivia Oliva
      Paola Paula Patricia Petra Priscila Paloma Pamela Perla Paz Paulina
      Raquel Rebeca Rosa Rocío Roxana Ramona Rosario Rubí Ruth Rita
      Sandra Sara Selene Selma Silvia Sofía Susana Sonia
      Tania Tatiana Teresa Tamara
      Úrsula
      Verónica Viridiana Vanesa Viviana Virginia Vera
      Wendy
      Xiomara Xóchitl
      Yadira
      Zaira
    )

    FIRST_NAMES = k MALE_FIRST_NAMES + FEMALE_FIRST_NAMES

    LAST_NAMES = k %w(Acevedo Acosta Aguilar Alanís Altamirano Alvarado Ávila Arenas Arroyo
      Alva Aguirre Aréchiga Álamos Álvarez Azcárraga Abrín Aldama Alfaro Arjona Arredondo
      Ballina Bautista Baños Benítez Bello Bobadilla Borja Barbosa Bracho Baltazar Bárcenas
      Bernal Bermúdez Blanco Bairez Batista Balderas Brambila Botello Barrera Barrientos Barajas
      Cervantes Calderón Carmona Caballero Campos Camacho Cortés Chávez Colín Contreras Cordero
      Covarrubias Cabrera Cabazos Castañeda Canales Calvario Cadenas Cabañas Castillo Castellanos
      Delgado Domínguez Duarte Durazo Dávalos Díaz De la Mora Durán Dueñas Dorantes Dávila
      Estevez Elizondo Escobar Escobedo Echeverría Espinoza Espino Escudero Estrada Esequiel Enríquez
      Figueroa Fernández Fontana Ferrer Feregrino Fierro Flores Fuentes Funes Fuertes Fregoso Franco
      García Graciado Gazcón Garcez Gavito Galván Gallegos Gómez Gordillo Guevara Guerrero Gil Góngora
      Hidalgo Hernández Higuera Huesca Hinojosa Hoyos Huerta Hurtado Herrera Heredia Holbein
      Ibarra Ibáñez Irineo Iniesta Islas Isunza Iturbe Iturbide Izquierdo Irineo Ibargüengoitia
      Jardón Jiménez Juárez Jacinto Jara Jasso Jorge Jaramillo Joya Jeréz Jurado
      Karrer Krazowski
      Ladrón Lara Laurel Ledesma Lezama Legorreta Lima Linares Luis Lozano López Lomelí Leyva Lamas León
      Lucio Luna Loera Limón
      Macedo Macías Mafún Maldonado Mancera Manjarrez Manzano Márquez Martínez Marín Méndez Mena Mercado
      Merino Meza Miranda Mojica Mondragón Monroy Montaño Montes Muñoz Mota Munguía Morán Mosqueda Mosco Morales
      Mantilla Malpica Machuca Meraz Mineros Millán Moreno Mujica
      Nájera Nava Navarrete Navarro Negrete Nery Nevárez Nuncio Naranjo Noguera Noyola Nieblas Noriega Núñez
      Ocampo Ortega Oca Ortíz Ochoa Ojeda Orozco Osio Onofre Olivares Olvera Ordaz Oropeza Otero Ovando Ovalle
      Pacheco Palacios Palma Pavón Paz Patrón Patiño Paredes Palomares Peralta Pelayo Pedroza Pascual Ponce Preciado
      Pérez Pulido Portillo Peña Peñaloza Pimentel
      Quiroz Quiñones Quintero Quintal Quino Quezada
      Ramos Rangel Rendón Ramírez Resendiz Ríos Rico Reza Reyes Rayón Ruiz Robles Rojas Rojo Román Romero Rosales
      Rodríguez Roa Rivero Rivera Reynaga Revueltas Rincón Rubio Rueda Rosado Rosas Rosales Roque
      Saavedra Sabugal Salas Salazar Sánchez Sandoval Santos Sepúlveda Sierra Sifuentes Sosa Soto Suárez Saenz
      Salgado Salamanca Salinas Sambrano Silva Simbrón Servín
      Tapia Tellez Tinoco Tejada Tamayo Torres Tolentino Tello Tejeda Troncoso Trujillo
      Ugalde Uribe Uzeta Ubaldo Ugalde Urbina Uribe Urzúa
      Vaca Valdéz Valdivia Velenzuela Vélez Velasco Vega Velázquez Vergara Villa Villaseñor Viloria Vilchis
      X XX XXX
      Yáñez
      Zepeda Zúñiga Zavala Zetina Zurita Zamorano
    )
   
    MALE_PREFIXES = k %w(Sr. C.)
    FEMALE_PREFIXES = k %w(Sra. Srita. C.)
    PREFIXES = k %w(Sr. Sra. Srita. C.)
    
    # Full name according to gender and prefix, possibly with middle_name
    def full_name(gender = :any, prefix = false)
      if prefix
        full_name_prefix(gender)
      else
        full_name_no_prefix(gender)
      end
    end
    
    # Full name with prefix according to gender, possibly with middle_name
    def full_name_prefix(gender = :any)
      case gender
        when :any then
          case rand(9)
            when 0, 3, 6, 8 then "#{female_prefix} #{female_name} #{paternal_last_names}"
            else "#{male_prefix} #{male_name} #{paternal_last_names}"
          end
        when :male then "#{male_prefix} #{male_name} #{paternal_last_names}"
        when :female then "#{female_prefix} #{female_name} #{paternal_last_names}"
        else raise ArgumentError, "Invalid gender, must be one of :any, :male, :female"
      end
    end
    
    # Full name with no prefix according to gender, possibly with middle_name
    def full_name_no_prefix(gender = :any)
      case gender
        when :any then
          case rand(9)
            when 0, 3, 6, 8 then "#{female_name} #{paternal_last_names}"
            else "#{male_name} #{paternal_last_names}"
          end
        when :male then "#{male_name} #{paternal_last_names}"
        when :female then "#{female_name} #{paternal_last_names}"
        else raise ArgumentError, "Invalid gender, must be one of :any, :male, :female"
      end
    end
   
    # Male first name and possibly middle name
    def male_name
      case rand(9)
        when 0, 5 then "#{first_name(:male)} #{middle_name(:male)}"
        else first_name(:male)
      end
    end
    
    # Female first name and possibly middle name
    def female_name
      case rand(9)
        when 0, 5 then "#{first_name(:female)} #{middle_name(:female)}"
        else first_name(:female)
      end
    end

    # A single name according to gender parameter
    def name(gender = :any)
      case gender
        when :any then FIRST_NAMES.rand
        when :male then MALE_FIRST_NAMES.rand
        when :female then FEMALE_FIRST_NAMES.rand
        else raise ArgumentError, "Invalid gender, must be one of :any, :male, :female"
      end
    end
    alias_method :middle_name, :name
    alias_method :first_name, :name
    
    # Father's and mother's last name
    def paternal_last_names
      "#{last_name} #{last_name}"
    end

    def last_name
      LAST_NAMES.rand
    end

    def prefix
      PREFIXES.rand
    end
    
    def male_prefix
      MALE_PREFIXES.rand
    end
    
    def female_prefix
      FEMALE_PREFIXES.rand
    end
    
  end
end
