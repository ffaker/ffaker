module Faker
  # thanks to http://baconipsum.com/
  module BaconIpsum
    extend ModuleUtils
    extend Lorem
    extend self

    def word
      BACON_WORDS.rand
    end

    def words(num = 3)
      BACON_WORDS.random_pick(num)
    end

    BACON_WORDS = k [
                     'beef',
                     'chicken',
                     'pork',
                     'bacon',
                     'chuck',
                     'short loin',
                     'sirloin',
                     'shank',
                     'flank',
                     'sausage',
                     'pork belly',
                     'shoulder',
                     'cow',
                     'pig',
                     'ground round',
                     'hamburger',
                     'meatball',
                     'tenderloin',
                     'strip steak',
                     't-bone',
                     'ribeye',
                     'shankle',
                     'tongue',
                     'tail',
                     'pork chop',
                     'pastrami',
                     'corned beef',
                     'jerky',
                     'ham',
                     'fatback',
                     'ham hock',
                     'pancetta',
                     'pork loin',
                     'short ribs',
                     'spare ribs',
                     'beef ribs',
                     'drumstick',
                     'tri-tip',
                     'ball tip',
                     'venison',
                     'turkey',
                     'biltong',
                     'rump',
                     'jowl',
                     'salami',
                     'bresaola',
                     'meatloaf',
                     'brisket',
                     'boudin',
                     'andouille',
                     'capicola',
                     'swine',
                     'kielbasa',
                     'frankfurter',
                     'prosciutto',
                     'filet mignon',
                     'leberkas',
                     'turducken',
                     'doner'
                    ]



  end
end
