module Faker
  module SwansonIpsum
    extend ModuleUtils
    extend Lorem
    extend self

    def word
      SWANSON_WORDS.rand
    end

    def words(num = 3)
      SWANSON_WORDS.random_pick(num)
    end

    SWANSON_WORDS = k [
      "Swanson", "Ron", "bacon", "meat", "government", "tax", "profits", "business",
      "parks" "alcohol", "breakfast", "ribs", "ex-wife", "food", "cloven", "hooves",
      "woodwork", "steel", "toolbox", "hammer", "Pawnee", "Tammy", "Knope", "Humpsville",
      "wreathes", "torches", "horrible", "department", "manager", "greedy", "piglet",
      "mustache", "scam", "philosophy", "respect", "horrifying", "hamburger", "ketchup",
      "crusade", "effigy", "kill", "hunting", "Mulligan", "steakhouse", "ribeye", "whiskey",
      "Lagavulin", "melancholy", "April", "worst", "Claymine", "rectangle", "America",
      "Megaphone", "Monday", "Butthole", "man", "whittel", "Horsemeals", "Eggporkalypse",
      "tornado", "apathetic", "mean", "greatness", "Capitalism", "rage", "property", "rights",
      "turkey", "communists", "spitballin", "slashing", "pork", "crackling", "Swoopeses",
      "fighting", "stabbed", "hellscape", "nightmare", "hate", "schlemiel", "schlamazel",
      "workshop", "liberty", "mustacheoed", "masculine", "Duke", "Silver", "bandsaw",
      "spokeshave", "sander", "preternaturally", "tolerance", "privatized", "deviled",
      "buffet"
    ]

  end
end
