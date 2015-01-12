# encoding: utf-8

require 'ffaker/address'

module Faker
  # Author wiseleyb<wiseleyb@gmail.com>
  module AddressAU
    include Faker::Address

    extend ModuleUtils
    extend self

    # based on areas labeled state (+act) here: http://en.wikipedia.org/wiki/States_and_territories_of_Australia
    STATE = [
      'Australian Capital Territory', 'New South Wales', 'Queensland',
      'South Australia', 'Tasmania', 'Victoria', 'Western Australia'
    ]
    STATE_ABBR = %w(ACT NSW NT QLD SA TAS VIC WA)
    # based on http://en.wikipedia.org/wiki/List_of_cities_in_Australia
    SUBURB = {
      "ACT"=>{
        "2600" => "Canberra", "2601"=>"Canberra", "2602"=>"O'Connor", "2612"=>"Braddon"},
        "NT" => {"0800"=>"Darwin", "0830"=>"Palmerston"},
        "SA" => {
          "5000"=>"Adelaide", "5015"=>"Port Adelaide", "5211"=>"Victor Harbor",
          "5251"=>"Mount Barker", "5253"=>"Murray Bridge", "5254"=>"Murray Bridge",
          "5290"=>"Mount Gambier", "5291"=>"Mount Gambier", "5540"=>"Port Pirie",
          "5600"=>"Whyalla", "5606"=>"Port Lincoln", "5607"=>"Port Lincoln",
          "5700"=>"Port Augusta", "5710"=>"Port Augusta"
        },
        "WA" => {
          "6000"=>"Perth", "6008"=>"Subiaco", "6009"=>"Nedlands",
          "6021"=>"Stirling", "6027"=>"Joondalup", "6053"=>"Bayswater",
          "6065"=>"Wanneroo", "6110"=>"Gosnells", "6112"=>"Armadale",
          "6151"=>"South Perth", "6156"=>"Melville", "6160"=>"Fremantle",
          "6168"=>"Rockingham", "6210"=>"Mandurah", "6230"=>"Bunbury",
          "6330"=>"Albany", "6430"=>"Kalgoorlie", "6530"=>"Geraldton"
        },
        "NSW" => {
          "2000"=>"Sydney", "2031"=>"Randwick", "2046"=>"Canada Bay",
          "2068"=>"Willoughby", "2112"=>"Ryde", "2142"=>"Holroyd",
          "2148"=>"Blacktown", "2150"=>"Parramatta", "2165"=>"Fairfield",
          "2170"=>"Liverpool", "2193"=>"Canterbury", "2200"=>"Bankstown",
          "2216"=>"Rockdale", "2220"=>"Hurstville", "2250"=>"Gosford",
          "2300"=>"Newcastle", "2320"=>"Maitland", "2325"=>"Cessnock",
          "2340"=>"Tamworth", "2350"=>"Armidale", "2450"=>"Coffs Harbour",
          "2460"=>"Grafton", "2480"=>"Lismore", "2500"=>"Wollongong",
          "2529"=>"Shellharbour", "2560"=>"Campbelltown", "2580"=>"Goulburn",
          "2620"=>"Queanbeyan", "2640"=>"Albury", "2650"=>"Wagga Wagga",
          "2680"=>"Griffith", "2750"=>"Penrith", "2790"=>"Lithgow",
          "2795"=>"Bathurst", "2800"=>"Orange", "2830"=>"Dubbo",
          "2880"=>"Broken Hill"
        },
        "QLD" => {
          "4000"=>"Brisbane", "4217"=>"Surfers Paradise", "4305"=>"Ipswich",
          "4350"=>"Toowoomba", "4370"=>"Warwick", "4551"=>"Caloundra",
          "4570"=>"Gympie", "4650"=>"Maryborough", "4655"=>"Hervey Bay",
          "4670"=>"Bundaberg", "4680"=>"Gladstone", "4700"=>"Rockhampton",
          "4740"=>"Mackay", "4810"=>"Townsville", "4820"=>"Charters Towers",
          "4825"=>"Mount Isa", "4870"=>"Cairns"
        },
        "VIC" => {
          "3000"=>"Melbourne", "3175"=>"Dandenong", "3199"=>"Frankston",
          "3220"=>"Geelong", "3280"=>"Warrnambool", "3300"=>"Hamilton",
          "3337"=>"Melton", "3350"=>"Ballarat", "3377"=>"Ararat",
          "3400"=>"Horsham", "3500"=>"Mildura", "3550"=>"Bendigo",
          "3585"=>"Swan Hill", "3630"=>"Shepparton", "3672"=>"Benalla",
          "3677"=>"Wangaratta", "3690"=>"Wodonga", "3825"=>"Moe",
          "3840"=>"Morwell", "3844"=>"Traralgon", "3850"=>"Sale",
          "3875"=>"Bairnsdale"
        },
        "TAS" => {
          "7000"=>"Hobart", "7010"=>"Glenorchy", "7250"=>"Launceston",
          "7310"=>"Devonport", "7320"=>"Burnie"
        }
    }
    POSTCODE = SUBURB.inject({}) { |h, (s_abbr, postcode_suburb_map)| h.update(s_abbr => postcode_suburb_map.keys) }

    def postcode(st_abbr = nil)
      st_abbr ||= state_abbr
      POSTCODE[st_abbr][rand(POSTCODE[st_abbr].size)]
    end

    def state
      STATE.sample
    end

    def state_abbr
      STATE_ABBR.sample
    end

    def suburb(st_abbr = nil, p_code = nil)
      st_abbr ||= state_abbr
      p_code  ||= postcode(st_abbr)
      SUBURB[st_abbr][p_code]
    end

    def full_address(st_abbr = nil)
      st_abbr ||= state_abbr
      "#{Faker::Address.street_address}, #{suburb(st_abbr)} #{st_abbr} #{postcode}"
    end
  end
end
