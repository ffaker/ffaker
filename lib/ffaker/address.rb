module Faker
  module Address
    extend ModuleUtils
    extend self

    # @deprecated US specific address info. Moved into {AddressUS}
    def zip_code
      warn '[zip_code] is deprecated. For US addresses please use the AddressUS module'
      Faker::AddressUS.zip_code
    end

    def us_state
      warn '[us_state] is deprecated. For US addresses please use the AddressUS module'
      Faker::AddressUS.state
    end

    def us_state_abbr
      warn '[state_abbr] is deprecated. For US addresses please use the AddressUS module'
      Faker::AddressUS.state_abbr
    end
    # end US deprecation

    def city_prefix
      CITY_PREFIXES.rand
    end

    def city_suffix
      CITY_SUFFIXES.rand
    end

    def city
      case rand(4)
      when 0 then '%s %s%s' % [city_prefix, Name.first_name, city_suffix]
      when 1 then '%s %s'   % [city_prefix, Name.first_name]
      when 2 then '%s%s'    % [Name.first_name, city_suffix]
      when 3 then '%s%s'    % [Name.last_name, city_suffix]
      end
    end

    def street_suffix
      STREET_SUFFIX.rand
    end

    def building_number
      Faker.numerify(( '#' * rand(3) ) << '###')
    end

    def street_name
      case rand(2)
      when 0 then "#{Name.last_name} #{street_suffix}"
      when 1 then "#{Name.first_name} #{street_suffix}"
      end
    end

    def street_address(include_secondary = false)
      str = "#{building_number} #{street_name}"
      str << " #{secondary_address}" if include_secondary
      str
    end

    def secondary_address
      Faker.numerify(SEC_ADDR.rand)
    end

    # @deprecated UK specific address info. Moved into {AddressUK}
    # UK Variants
    def uk_county
      warn '[uk_county] is deprecated. For UK addresses please use the AddressUK module'
      Faker::AddressUK.county
    end

    def uk_country
      warn '[uk_country] is deprecated. For UK addresses please use the AddressUK module'
      Faker::AddressUK.country
    end

    def uk_postcode
      warn '[uk_postcode] is deprecated. For UK addresses please use the AddressUK module'
      Faker::AddressUK.postcode
    end
    # end UK deprecation
    
    def neighborhood
      NEIGHBORHOOD.rand
    end

    def country
      COUNTRY.rand
    end

    COMPASS_DIRECTIONS = k %w(North East West South)

    CITY_PREFIXES = k(COMPASS_DIRECTIONS + %w(New Lake Port))

    CITY_SUFFIXES = k %w(town ton land ville berg burgh borough bury view port
                        mouth stad furt chester mouth fort haven side shire)

    STREET_SUFFIX = k %w(Alley Avenue Branch Bridge Brook Brooks
      Burg Burgs Bypass Camp Canyon Cape Causeway Center Centers Circle Circles
      Cliff Cliffs Club Common Corner Corners Course Court Courts Cove Coves
      Creek Crescent Crest Crossing Crossroad Curve Dale Dam Divide Drive Drives
      Estate Estates Expressway Extension Extensions Fall Falls Ferry
      Field Fields Flat Flats Ford Fords Forest Forge Forges Fork Forks Fort
      Freeway Garden Gardens Gateway Glen Glens Green Greens Grove Groves Harbor
      Harbors Haven Heights Highway Hill Hills Hollow Inlet Island
      Islands Isle Junction Junctions Key Keys Knoll Knolls Lake
      Lakes Land Landing Lane Light Lights Loaf Lock Locks Lodge Loop
      Mall Manor Manors Meadow Meadows Mews Mill Mills Mission Motorway
      Mount Mountain Mountains Neck Orchard Oval Overpass Park
      Parks Parkway Parkways Pass Passage Path Pike Pine Pines Place Plain Plains
      Plaza Point Points Port Ports Prairie
      Radial Ramp Ranch Rapid Rapids Rest Ridge Ridges River Road Roads
      Route Row Rue Run Shoal Shoals Shore Shores Skyway Spring Springs
      Spur Spurs Square Squares Station Stravenue
      Stream Street Streets Summit Terrace
      Throughway Trace Track Trafficway Trail Tunnel
      Turnpike Underpass Union Unions Valley Valleys Via Viaduct View Views
      Village Villages Ville Vista Walk Walks Wall Way Ways Well Wells)

    SEC_ADDR = k ['Apt. ###', 'Suite ###']

    NEIGHBORHOOD = k ['East of Telegraph Road', 'North Norridge', 'Northwest Midlothian/Midlothian Country Club',
      'Mott Haven/Port Morris', 'Kingsbridge Heights', 'Bronxdale', 'Pennypack', 'Bridesburg',
      'Allegheny West', 'Bushwick South', 'Dyker Heights', 'Ocean Parkway South', 'Summerlin North',
      'Seven Hills Area', 'Greater Las Vegas National', 'phoenix', 'Central Chandler', 'South of Bell Road',
      'River Heights', 'White Plains Central', 'Mount Kisco West', 'Pound Ridge East', 'Babylon Bayside',
      'Sagaponack Seaside', 'South of Lake Ave', 'Far Rockaway/Bayswater', 'Jamaica Estates/Holliswood',
      'Murray Hill', 'East Renton', 'Renton West', 'Auburn North', 'Northwoods West', 'Florissant West',
      'Ladue South', 'Candlewood Country Club', 'West Covina East', 'North East Irwindale', 'Sunshine-Gardens',
      'Cipriani', 'Brentwood Central', 'Jupiter South/Abacoa', 'Sea Ranch Lakes', 'Schall Circle/Lakeside Green',
      'Olmsted Falls Central', 'South of Lake Shore Blvd', 'Gates Mills North', 'White Oak South of Columbia Pike',
      'Rockville East of Hungerford Dr', 'Cleveland Park']

    COUNTRY = k ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", 
      "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", 
      "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", 
      "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Bouvet Island", "Brazil", 
      "British Indian Ocean Territory", "British Virgin Islands", "Brunei", 
      "Bulgaria", "Burkina Faso", "Burundi", 
      "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", 
      "Chad", "Chile", "China", "Christmas Island", "Cocos Islands", "Colombia", "Comoros", 
      "Congo", "Congo", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", 
      "Czech Republic", 
      "Denmark", "Djibouti", "Dominica", "Dominican Republic", 
      "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", 
      "Faroe Islands", "Falkland Islands", "Fiji", "Finland", "France", "French Guiana", 
      "French Polynesia", "French Southern Territories", 
      "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", 
      "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", 
      "Haiti", "Honduras", "Hong Kong", "Hungary", 
      "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", 
      "Jamaica", "Japan", "Jersey", "Jordan", 
      "Kazakhstan", "Kenya", "Kiribati", "Korea", "Korea", "Kuwait", "Kyrgyz Republic", 
      "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", 
      "Libya", "Liechtenstein", "Lithuania", "Luxembourg", 
      "Macao", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", 
      "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia", "Moldova", 
      "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", 
      "Namibia", "Nauru", "Nepal", "Netherlands Antilles", "Netherlands", "New Caledonia", "New Zealand", 
      "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", 
      "Oman", 
      "Pakistan", "Palau", "Palestinian Territory", "Panama", "Papua New Guinea", "Paraguay", "Peru", 
      "Philippines", "Pitcairn Islands", "Poland", "Portugal", "Puerto Rico", 
      "Qatar", 
      "Reunion", "Romania", "Russian Federation", "Rwanda", 
      "St. Barthelemy", "St. Helena", "St. Kitts and Nevis", "St. Lucia", "St. Martin", 
      "St. Pierre and Miquelon", "St. Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", 
      "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", 
      "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and South Sandwich Islands",
      "Spain", "Sri Lanka", "Sudan", "Suriname", "Svalbard & Jan Mayen Islands", "Swaziland", "Sweden", 
      "Switzerland", "Syrian Arab Republic",
      "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor-Leste", "Togo", "Tokelau", "Tonga", 
      "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", 
      "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States of America", 
      "US Minor Outlying Islands", "US Virgin Islands", "Uruguay", "Uzbekistan", 
      "Vanuatu", "Venezuela", "Vietnam", 
      "Wallis and Futuna", "Western Sahara", 
      "Yemen", 
      "Zambia", "Zimbabwe"]
  end
end
