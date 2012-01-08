# => author: wiseleyb
# => email: wiseleyb@gmail.com
module Faker
  module AddressAU
    include Faker::Address
    extend ModuleUtils
    extend self

    def zip_code(st_abbr = nil)
      st_abbr ||= state_abbr
      ZIP_CODE[st_abbr][rand(ZIP_CODE[st_abbr].size)]
    end

    alias :postcode :zip_code

    def state
      STATE.rand
    end

    def state_abbr
      STATE_ABBR.rand
    end
    
    def city(st_abbr = nil)
      st_abbr ||= state_abbr
      CITY[st_abbr][rand(CITY[st_abbr].size)]
    end

    def full_address(st_abbr = nil)
      st_abbr ||= state_abbr
      "#{Faker::Address.street_address}, #{city(st_abbr)} #{st_abbr} #{zip_code}"
    end
    
    ZIP_FORMATS = k ['####']

    # based on areas labeled state (+act) here: http://en.wikipedia.org/wiki/States_and_territories_of_Australia
    STATE = k ['Australian Capital Territory', 'New South Wales', 'Queensland', 'South Australia', 'Tasmania', 'Victoria', 'Western Australia']

    STATE_ABBR = k %w(ACT NSW NT QLD SA TAS VIC WA)
    
    # based on http://en.wikipedia.org/wiki/List_of_cities_in_Australia
    CITY = {
      "ACT" => ["Canberra", "Ainslie", "Braddon", "O'Connor"],
      "NSW" => ["Albury", "Armidale", "Bankstown", "Bathurst", "Blacktown", "Blue Mountains", "Botany Bay", 
        "Broken Hill", "Campbelltown", "Canada Bay", "Canterbury", "Cessnock", "Coffs Harbour", "Dubbo", 
        "Fairfield", "Gosford", "Goulburn", "Grafton", "Greater Taree", "Griffith", "Hawkesbury", "Holroyd", 
        "Hurstville", "Lake Macquarie", "Lismore", "Lithgow", "Liverpool", "Maitland", "Newcastle", "Orange", 
        "Parramatta", "Penrith", "Queanbeyan", "Randwick", "Rockdale", "Ryde", "Shellharbour", "Shoalhaven", 
        "Sydney", "Tamworth", "Wagga Wagga", "Willoughby", "Wollongong"],
      "NT" => ["Darwin","Palmerston"],
      "QLD" => ["Brisbane", "Bundaberg", "Cairns", "Caloundra", "Charters Towers", "Gladstone", "Gold Coast", 
        "Gympie", "Hervey Bay", "Ipswich", "Logan City", "Mackay", "Maryborough", "Mount Isa", "Redcliffe City", 
        "Redland City", "Rockhampton", "Sunshine Coast", "Surfers Paradise", "Thuringowa", "Toowoomba", "Townsville", 
        "Warwick"],
      "SA" => ["Adelaide", "Mount Barker", "Mount Gambier", "Murray Bridge", "Port Adelaide", "Port Augusta", 
        "Port Lincoln", "Port Pirie", "Victor Harbor", "Whyalla"],
      "TAS" => ["Burnie", "Clarence", "Devonport", "Glenorchy", "Hobart", "Launceston"],
      "VIC" => ["Ararat", "Bairnsdale", "Ballarat", "Benalla", "Bendigo", "Dandenong", "Frankston", "Geelong", 
        "Hamilton", "Horsham", "Melbourne", "Melton", "Mildura", "Moe", "Morwell", "Sale", "Shepparton", 
        "Swan Hill", "Traralgon", "Wangaratta", "Warrnambool", "Wodonga"],
      "WA" => ["Albany", "Armadale", "Bayswater", "Bunbury", "Canning", "Cockburn", "Fremantle", "Geraldton", 
        "Gosnells", "Joondalup", "Kalgoorlie", "Mandurah", "Melville", "Nedlands", "Perth", "Rockingham", 
        "South Perth", "Stirling", "Subiaco", "Swan", "Wanneroo"]
    }
    CITIES = CITY.keys.collect {|k| CITY[k]}.flatten.sort
    
    # based on http://en.wikipedia.org/wiki/Postcodes_in_Australia
    ZIP_CODE = {
      "NSW" => [("1000".."1999").to_a + ("2000".."2599").to_a + ("2619".."2898").to_a + ("2921".."2999").to_a].flatten,
      "ACT" => [("0200".."0299").to_a + ("2600".."2618").to_a + ("2900".."2920").to_a].flatten,
      "VIC" => [("3000".."3999").to_a + ("8000".."8999").to_a].flatten,
      "QLD" => [("4000".."4999").to_a + ("9000".."9999").to_a].flatten,
      "SA"  => [("5000".."5799").to_a + ("5800".."5999").to_a].flatten,
      "WA"  => [("6000".."6797").to_a + ("6800".."6999").to_a].flatten,
      "TAS" => [("7000".."7799").to_a + ("7800".."7999").to_a].flatten,
      "NT"  => [("0800".."0899").to_a + ("0900".."0999").to_a].flatten
    }
    ZIP_CODES = ZIP_CODE.keys.collect {|k| ZIP_CODE[k]}.flatten.sort

  end
end


