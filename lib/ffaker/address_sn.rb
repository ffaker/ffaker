# encoding: utf-8

# => author: PapePathe github.com/PapePathe
# => email: pathe.sene@gmail.com

module Faker

  module AddressSN

    include Faker::Address
    extend ModuleUtils
    extend self

    # Constantes

    # Arrondissements
    #
    ARRONDISSEMENTS = k ['Biscuiterie',  'Cambérène',  'Dieuppeul-Derklé',  'Fann-Point E-Amitié',  'Gueule Tapée-Fass-Colobane',  'Gorée',  'Grand Yoff',  'Grand Dakar',  'Hann Bel-Air',  'HLM',  'Médina',  'Mermoz-Sacré-Cœur',  'Ngor',  'Ouakam',  'Parcelles Assainies',  'Patte Doie',  'Dakar-Plateau',' Sicap-Liberté',  'Yoff', 'Dalifort',  'Djidah Thiaroye Kaw',  'Guinaw Rail Nord',  'Guinaw Rail Sud',  'Pikine Est', ' Pikine Nord',  'Pikine Ouest',  'Keur Massar',  'Malika',  'Yeumbeul Nord',  'Yeumbeul Sud',  'Diamaguène', 'Sicap Mbao',  'Mbao',  'Thiaroye Gare',  'Thiaroye Sur Mer',  'Tivaouane Diacksao', 'Golf Sud',  'Médina Gounass',  'Ndiarème Limamoulaye',  'Sam Notaire',  'Wakhinane Nimzatt', 'Rufisque Est',  'Rufisque Nord', 'Rufisque Ouest', 'Thiès Est', 'Thiès Nord',  'Thiès Ouest']

    # Departements
    #
    DEPARTEMENTS    = k ['dakar', 'pikine', 'guediawaye', 'rufisque', 'bambey',	'diourbel',	'mbacke',	'fatick',	'foundiougne',	'gossas', 'Kaolack', 'Guinguineo',	'nioro du rip', 'kolda', 'velingara',	'medina yoro foulah', 'Kebemer', 'Linguere',	'Louga', 'Kanel',	'Matam', 'Ranerou', 'Dagana',	'Podor',	'Saint-Louis', 'Bakel',	'Koumpentoum',	'Tambacounda', 'Mbour',	'Thies',	'Tivaouane', 'Bignogna',	'Oussouye',	'Ziguinchor', 'Birkilane','Kaffrine', 'Malem Hodar', 'Kedougou',	'Salemata',	'Saraya', 'Bounkiling',	'Goudomp',	'Sedhiou'	 ]

    # Régions
    #
    REGIONS         = k ['dakar', 'diourbel', 'fatick', 'kaffrine', 'kaolack', 'kolda', 'kedougou', 'louga', 'matam', 'saint louis', 'sedhiou', 'tambacouda', 'thies', 'ziguinchor']


    # region
    #
    def region
      REGIONS.rand
    end
    
    # departement
    #
    def departement
      DEPARTEMENTS.rand
    end

    # arrondissement
    #
    def arrondissement
      ARRONDISSEMENTS.rand
    end

  end

end