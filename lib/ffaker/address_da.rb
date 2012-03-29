module Faker
  module AddressDA
    include Faker::Address
    extend ModuleUtils
    extend self

    def zip_code
      Faker.numerify ZIP_FORMATS.rand
    end

    def post_nr
      zip_code
    end

    def state
      kommune
    end

    def kommune
      KOMMUNE.rand
    end

    def region
      REGION.rand
    end

    def city
      CITY.rand
    end

    ZIP_FORMATS = k ['####']

    def street_name
      STREET.rand
    end

    def street_address
      "#{Faker::AddressDA.street_address} #{rand(100)}"
    end

    def full_address
      %Q{#{street_address}
#{post_nr} #{city}
#{region}
DANMARK
}
    end

    STREET = k [
      "Absalonsvej","Agrovej","Ahornvej","Akacievej","Akelejehaven","Alvedgårdsvej","Alvedstræde","Anemonevej","Annexgårdsparken","Annexgårdsvej","Arresøgårdsvej","Arresøvej","Askevang","Avlholmgårdsvej",
      "Bakkekær","Bakkevej","Baldersbrøndegade","Baldersbuen","Baldersvej","Banestrøget","Bartholinstræde","Bavneåsen","Bellevue Strand","Berberisvej","Beredskabsvej","Berings Gade","Birkegården","Birkehegnet","Birkehøjvej","Birkelien","Birketoften","Birkevang","Birkevangen","Birkevej","Blekinge Boulevard","Blommehegnet","Bogmosen","Bohus Boulevard","Bolandsvej","Bomager","Bondehøjvej","Borupvej","Bousagervej","Brandhøjgårdsvej","Bredebjergvej","Bredekær","Bremerholmen","Bremertoften","Bringebakken","Bringehusene","Bringekrogen","Bringetoften","Bringevej","Bringevænget","Broengen","Brogårdsvej","Brombærhegnet","Bronzealderen","Brostrædet","Brovænget","Brunellevej","Brunsøvej","Bruunsvej","Brydetoften","Brønsgårdsvej","Brønsholm Kongevej","Brønsholmvej","Brønshulevej","Bundsvej","Bybrøndstræde","Bygaden","Bygmarken","Bynkehaven","Byvej","Byvejen","Bækgårdsvej","Bæksø","Bøgehaven","Bøgekrattet","Bøgevang","Bøgevej","Bøllemosegårdsvej","Bøllemosevej",
      "Carl Gustavs Gade","Cathrinebergvej","Cederlunden","Charlotteager","Charlottegårdsvej","Chr Hauchs Alle","Christianshøjvej","City 2",
      "Dalbergstrøget","Dalgårdsvej","Damgårdsvej","Damhusvænget","Damhøjvej","Damsholtevej","Damtoften","Damtofteparken","Dannevang","Danstrupvej","Davidsvænge","Digeager","Digelsvej","Divisionsvænget","Donsevej","Drosselvænget","Duekær","Dybendalsvænget","Dybkærvænget","Dyssevej","Dådyrvænget","Dæmpegårdsvej",
      "Egager","Egekrattet","Egernvænget","Egestedvej","Egevangen","Egevej","Egholmsvej","Eigtveds Alle","Ellekildevej","Ellevej","Elme Alle","Elmekrogen","Elverdalsvej","Endrup Byvej","Enebærkrattet","Engbrinken","Engelholm Alle","Enggårdsvej","Enghavegårdsvej","Enghaven","Engvej","Enighedsvej","Erhvervsvej","Erik Husfeldts Vej","Eskildsvej","Estland Alle",
      "Fagerbo","Fasanvænget","Fjællebro","Flintebjergvej","Flinterne","Fløng Byvej","Fløngvej","Fløngvænget","Folehavevej","Forsythiavej","Fredensvej","Frederiksholms","Frederiksholmsvej","Frøbjerget","Frødalen","Frøgård Alle","Frøhaven","Frøvænget","Fyrrekrattet","Fyrrevang","Fyrrevej",
      "Gadehavegårdsvej","Galgebakkevej","Gammel Bygade","Gammel Hareskovvej","Gammel Åvej","Gammelsøhøj","Geerslettevej","Georg Hansens Ager","Girostrøget","Gran Alle","Granbakken","Granstien","Granvej","Gregersensvej","Grønholtvangen","Grønholtvej","Guldalderen","Gunderødvej","Gyvelhaven","Gyvelhegnet","Gyvelvej","Gårdager","Gørløsevej",
      "Hakkemosevej","Halland Boulevard","Hallandsparken","Hammeren","Hammersholt Byvej","Hammershøjvej","Hans Andersensvej","Hasejevej","Haslevgade","Hasselvej","Havedamsvej","Haveforen. Bakkevej","Haveforen. Brandhøj","Havlyngbuen","Havremarken","Hedegaardsvej","Hedeland","Hedelandsstien","Hedelykken","Hedevej","Helgeshøj Alle","Helsingørsvej","Herringløsevej","Hindbærhegnet","Hjortevænget","Hjortholmgårdsvej","Hjørnestenen","Holmegårdsparken","Holmegårdsvej","Holmegårdsvænget","Holmemarksvej","Holmenevej","Holtebakken","Holtedam","Horsemosevej","Hortensiavej","Hostavej","Hovedgaden","Hovmarken","Hovmarksstien","Hovmarksvej","Hultoften","Hulvejen","Humlebækvej","Humlehegnet","Humlemosevej","Humletoften","Hybenhegnet","Hybenvej","Hyldager","Hyldekrattet","Hyldevangen","Håndværkerbakken","Høholmvej","Højager","Højbakkegård Alle","Højbakkevej","Høje Lønholt","Høje Taastrup","Høje Taastrup Gade","Højlundevej","Højsagervej","Højsdal","Højvangsvej","Høkerstræde","Hørager","Hørsholmvej","Hørskætten","Hørsvinget",
      "Ildtornvej","Industribakken","Industrivænget","Ingersvej","Ishøj Centervej","Islandshøjparken",
      "Jagtvej","Jasminhaven","Jasminvej","Jernalderen","Jernvedvej","Johannes Hages Alle","Jonstrup Vænge","Jonstruphøj","Jonstrupvangvej","Jonstrupvej","Jægerbakken","Jørlunde Overdrev",
      "Kallerupvej","Karlebo","Karlebo Markvej","Kastaniens","Kastaniens Kvarter","Kastanjegang","Katrinevej","Keglens Kvarter","Kellerisvej","Kildebakken","Kildehusene","Kildelunden","Kildemosevej","Kildetoften","Kildevej","Kildevænget","Kirke Værløsevej","Kirkebakken","Kirkegårdsvej","Kirkeleddet","Kirkeltehusvej","Kirkeltevej","Kirkestien","Kirkestræde","Kjeldgårdsvej","Klevehøjvej","Klinken","Klintehaven","Klinthøj Alle","Klovtoftegade","Klovtofteparken","Kløverhaven","Kløvermarksvej","Kløvervej","Knud Hjortøsvej","Knudsvej","Kohøjvej","Kongevejen","Konkyliestien","Koppen","Koralstien","Kornelhegnet","Korpsvænget","Korsbjergpark","Korsebjergengen","Korshavevej","Kraghave Parkvej","Kraghavevej","Krogager","Kroparken","Kroppedals Alle","Kuglens Kvarter","Kæmpehøj","Kærengen","Kærhavegårdsvej","Kærmindevej",
      "L A Rings Vænge","Landsbygaden","Langageren","Langelunden","Langerødvej","Langstrup Mose","Langstrupvej","Langås","Lavendelvej","Leen A","Leen B","Leen C","Leen D","Leen E","Leen F","Leen G","Leen H","Leen I","Lejrvej","Lerbakkevej","Lersøstien","Lervangen","Letland Alle","Ligustervej","Lille Kongevej","Lille Solhøjvej","Lilleager","Lillemosevej","Lillevangsvej","Lindegang","Lindegårdsager","Lindevej","Liselundager","Litauen Alle","Ludvig Finds Vej","Lupingang","Lyngevej","Lystholm","Lærkelunden","Lærketoften","Lærkevej","Løberen","Løjeltevej","Lønholtvej","Løvefodvej",
      "M W Gjøes Vej","Maglehøjgårdsvej","Maglehøjtoften","Maglemosevej","Magnoliavej","Marbjerg Byvej","Marbjergholmsvej","Margerittens","Marie Alle","Mariehøj","Midtervej","Morelhaven","Moseager","Mosedalen","Mosegårdsvej","Mosekilen","Mosevænget","Munkegårds Alle","Murertoften","Murskeen","Muslingestien","Myremosevej","Månebakken","Månedalstien","Mølleager","Mølledalen","Møllestedet","Møllevangen","Møllevej",
      "Niebuhr Gade","Niverød","Niverød Bakke","Niverød Kongevej","Niverødgårdsvej","Nivåhøj","Nivåvej","Nordre Strandvej","Nordtoften","Nordvang","Ny Hjortespringvej","Nybovej","Nybølle Vad","Nøddekrattet","Nørreby Alle","Nørreby Torv","Nørregade","Nørrekær","Nørremarken",
      "Oldenburg Alle","Oldvejen","Ole Lippmanns Vej","Ole Rømers Vej","Olivenlunden",
      "Palmelunden","Parallelvej","Peder","Peder Oxesvej","Perikonhegnet","Pilehaven","Pilekrattet","Pilenborgvej","Pileurtvej","Pilevangsdal","Pilevej","Pilevænget","Plantagevej","Poppel Alle","Poppelvej","Porsehaven","Porsemosevej","Postgade","Potentilvej","Poul Hansens Vænge","Priors Alle","Præstegårdsvej","Præstemosevej","Præstevænget",
      "Rafteager","Rantzausvej","Ravnehusparken","Ravnehusvej","Ravnekrogen","Refmosevej","Ribeshegnet","Ribesvej","Ringvej B 4","Rolandsvej","Rolfsvej","Rolighedsvej","Rosen Alle","Rosenager","Rosengang","Rosenhegnet","Rosenhøj","Rosens","Rosens Kvarter","Roskildevej","Rundageren","Ryethøjvej","Ryvej","Rådyrvej","Rævebakkevej","Rødegårdsvej","Rødehusvej","Rønnehegnet","Rønnevej","Rørmosen","Rørsøstien",
      "Salvievej","Sandet","Sandvejen","Sengeløsevej","Sirius Alle","Skagensgade","Skandrups Alle","Skelvej","Skiftet","Skjeberg Alle","Skjørrings Vænge","Skov Alle","Skovbovænget","Skovdalen","Skovgårdsvej","Skovhavevej","Skovhegnet","Skovhuskrogen","Skovkildevej","Skovlystvej","Skovmose Alle","Skovmose Side Alle","Skovsvinget","Skråplanet","Skåne Boulevard","Sletteager","Slåenhegnet","Slåenhøj","Smedegade","Smedevej","Smedevænget","Snebærvej","Sneklokkehegnet","Sneppevænget","Snerlehaven","Snubbekorsvej","Soderupvej","Sognekæret","Sognevangen","Sognevej","Solager","Solbakken","Solbakkevej","Solbjergvej","Solbærhegnet","Soldalen","Solengen","Solhaven","Solhøj","Solhøjvej","Solkrogen","Solvang","Solvej","Solvænget","Spangåvej","Sparrebro","Spiræavej","Spjeldager","Spotorno Alle","Stationsvej","Stejlepladsvej","Stenalderen","Stenborgvej","Stendiget","Stendyssevej","Stenrølds Alle","Stjernedalen","Storager","Storemosen","Storengen","Storkekrogen","Stormly","Stormvang","Strandgang","Struergade","Strømsvej","Studekrogen","Stærkendevej","Svendsvej","Svinget","Sydstjernen","Sylen","Syrengang","Syrenhegnet","Syrenvej","Søanemonestien","Søholmvej","Søkrogen","Sømosevej","Sønderby Torv","Søndervangen","Sørupvej","Søvangs Alle",
      "Teglbrændertoften","Teglbuen","Teglevej","Teglholmsvej","Telegade","Terningens Kvarter","Thistedgade","Thorbjergvej","Thorsager","Thorsbrovej","Tibberup Alle","Tibbevangen","Timianhaven","Tingstedvej","Tingstenen","Tjørneager","Tjørnekrattet","Tjørnen","Toeltvej","Tofteledet","Toften","Toftevej","Topager","Tornehegnet","Torslunde Bygade","Torslundevej","Torstorpvej","Tostholmvej","Tranemosevej","Truelshøj","Truelsvang","Tårnhøjgård","Tårnkær","Tørvevej",
      "Udsigten","Uglesø Mosevej","Vadsby Bygade","Vadsbystræde","Vadsbyvej","Vagtelvænget","Valdemarsvej","Valmuens","Valmuens Kvarter","Vandtårnsvej","Vandværksvej","Vartovvej","Vasekær","Ved Gadekæret","Ved Kastrupfortet","Ved Kæret","Vejenbrødvej","Veksebovej","Vesterby Alle","Vesterby Torv","Vesterled","Vestervang","Vestre Alle","Vibe Alle","Vibensholmsvej","Vigerslev Allé","Vildrosevej","Vinterhusvej","Vintoften","Violens","Violens Kvarter","Vænget","Værløse Gydevej",
      "Walgerholm","Weirsøevej","Wilhelmsvej",
      "Ågesholmsvej","Åhusene","Åløbet","Åskrænten","Åsletten","Åtoften","Åvej","Åvænget",
      "Æblets Kvarter","Øksen","Østengen","Østerby Alle",
      "Østerby Torv","Østre Alle","Øtoftegårdsvej"
    ]

    KOMMUNE = k [
      "Aabenraa","Aalborg","Aarhus","Albertslund","Allerød","Assens","Billund","Bornholm","Brønderslev","Egedal","Esbjerg","Faaborg-Midtfyn","Fanø","Favrskov","Faxe",
      "Fredensborg","Fredericia","Frederikshavn","Frederikssund","Furesø","Gentofte","Greve","Gribskov","Guldborgsund","Haderslev","Halsnæs","Hedensted","Helsingør",
      "Herlev","Herning","Hillerød","Hjørring","Holbæk","Holstebro","Horsens","Høje-Taastrup","Hørsholm","Ikast-Brande","Ishøj","Jammerbugt","Kalundborg","Kerteminde",
      "Kolding","Kujalleq","København","Køge","Langeland","Lejre","Lemvig","Lolland","Læsø","Mariagerfjord","Middelfart","Morsø","Norddjurs","Nordfyns","Nyborg","Næstved",
      "Odder","Odense","Odsherred","Qaasuitsup","Qeqqata","Randers","Rebild","Ringkøbing-Skjern","Ringsted","Roskilde","Rudersdal","Rødovre","Samsø","Sermersooq","Silkeborg",
      "Skanderborg","Skive","Slagelse","Solrød","Sorø","Stevns","Struer","Svendborg","Syddjurs","Sønderborg","Thisted","Tønder","Varde","Vejen","Vejle","Vesthimmerlands","Viborg","Vordingborg","Ærø"
    ]

    REGION = k [
      'Hovedstaden', 'Sjælland', 'Syddanmark', 'Midtjylland', 'Nordjylland'
    ]

    STATE = REGION

    CITY = k [
      'Aabenraa','Aabybro','Aakirkeby','Aalborg','Aalborg SV','Aalborg SØ','Aalborg Øst','Aalestrup','Aars','Aarup',
      'Agedrup','Agerbæk','Agerskov','Albertslund','Allerød','Allinge','Allingåbro','Almind','Anholt','Ans By',
      'Ansager','Arden','Asaa','Askeby','Asnæs','Asperup','Assens','Augustenborg','Aulum','Auning',
      'Bagenkop','Bagsværd','Balle','Ballerup','Bandholm','Barrit','Beder','Bedsted Thy','Bevtoft','Billum',
      'Billund','Bindslev','Birkerød','Bjerringbro','Bjert','Bjæverskov','Blokhus','Blommenslyst','Blåvand','Boeslunde',
      'Bogense','Bogø By','Bolderslev','Bording','Borre','Borup','Brøndby','Brabrand','Bramming','Brande',
      'Branderup J','Bredebro','Bredsten','Brenderup Fyn','Broager','Broby','Brovst','Bryrup','Brædstrup','Brøndby Strand',
      'Brønderslev','Brønshøj','Brørup','Bylderup-Bov','Bække','Bækmarksbro','Bælum','Børkop','Bøvlingbjerg','Charlottenlund',
      'Christiansfeld','Dalby','Dalmose','Dannemare','Daugård','Dianalund','Dragør','Dronninglund','Dronningmølle','Dybvad',
      'Dyssegård','Ebberup','Ebeltoft','Egernsund','Egtved','Egå','Ejby','Ejstrupholm','Engesvang','Errindlev',
      'Erslev','Esbjerg','Esbjerg N','Esbjerg V','Esbjerg Ø','Eskebjerg','Eskilstrup','Espergærde','Faaborg','Fanø',
      'Farsø','Farum','Faxe','Faxe Ladeplads','Fejø','Ferritslev Fyn','Fjenneslev','Fjerritslev','Flemming','Fredensborg'
      'Fredericia','Frederiksberg C','Frederikshavn','Frederikssund','Frederiksværk','Frørup','Frøstrup','Fuglebjerg','Fur','Føllenslev',
      'Føvling','Fårevejle','Fårup','Fårvang','Gadbjerg','Gadstrup','Galten','Gandrup','Gedser','Gedsted',
      'Gedved','Gelsted','Gentofte','Gesten','Gilleleje','Gislev','Gislinge','Gistrup','Give','Gjerlev J',
      'Gjern','Glamsbjerg','Glejbjerg','Glesborg','Glostrup','Glumsø','Gram','Gredstedbro','Grenaa','Greve',
      'Grevinge','Grindsted','Græsted','Gråsten','Gudbjerg Sydfyn','Gudhjem','Gudme','Guldborg','Gørding','Gørlev',
      'Gørløse','Haarby','Haderslev','Haderup','Hadsten','Hadsund','Hals','Hammel','Hampen','Hanstholm',
      'Harboøre','Harlev J','Harndrup','Harpelunde','Hasle','Haslev','Hasselager','Havdrup','Havndal','Hedehusene',
      'Hedensted','Hejls','Hejnsvig','Hellebæk','Hellerup','Helsinge','Helsingør','Hemmet','Henne','Herfølge',
      'Herlev','Herlufmagle','Herning','Hesselager','Hillerød','Hinnerup','Hirtshals','Hjallerup','Hjerm','Hjortshøj',
      'Hjørring','Hobro','Holbæk','Holeby','Holmegaard','Holstebro','Holsted','Holte','Horbelev','Hornbæk',
      'Hornslet','Hornsyld','Horsens','Horslunde','Hovborg','Hovedgård','Humble','Humlebæk','Hundested','Hundslund',
      'Hurup Thy','Hvalsø','Hvide Sande','Hvidovre','Højbjerg','Højby','Højer','Højslev','Høng','Hørning',
      'Hørsholm','Hørve','Hårlev','Idestrup','Ikast','Ishøj','Janderup Vestj','Jelling','Jerslev J','Jerslev Sjælland',
      'Jerup','Jordrup','Juelsminde','Jyderup','Jyllinge','Jystrup Midtsj','Jægerspris','Kalundborg','Kalvehave','Karby',
      'Karise','Karlslunde','Karrebæksminde','Karup J','Kastrup','Kerteminde','Kettinge','Kibæk','Kirke Eskilstrup','Kirke Hyllinge',
      'Kirke Såby','Kjellerup','Klampenborg','Klarup','Klemensker','Klippinge','Klovborg','Knebel','Kokkedal','Kolding',
      'Kolind','Kongens Lyngby','Kongerslev','Korsør','Kruså','Kvistgård','Kværndrup','København K','København N','København NV',
      'København S','København SV', 'København V','København Ø','Køge','Langebæk','Langeskov','Langå','Lejre','Lem St',
      'Lemming','Lemvig','Lille Skensved','Lintrup','Liseleje','Lundby','Lunderskov','Lynge','Lystrup','Læsø',
      'Løgstrup','Løgstør','Løgumkloster','Løkken','Løsning','Låsby','Malling','Mariager','Maribo','Marslev',
      'Marstal','Martofte','Melby','Mern','Mesinge','Middelfart','Millinge','Morud','Munke Bjergby','Munkebo',
      'Møldrup','Mørke','Mørkøv','Måløv','Mårslet','Nakskov','Nexø','Nibe','Nimtofte','Nivå',
      'Nordborg','Nyborg','Nykøbing F','Nykøbing M','Nykøbing Sj','Nyrup','Nysted','Nærum','Næstved','Nørager',
      'Nørre Aaby','Nørre Alslev','Nørre Asmindrup','Nørre Nebel','Nørre Snede','Nørreballe','Nørresundby','Odder','Odense C','Odense M',
      'Odense N','Odense NV','Odense NØ','Odense S','Odense SV','Odense SØ','Odense V','Oksbøl','Otterup','Oure',
      'Outrup','Padborg','Pandrup','Præstø','Randbøl','Randers C','Randers NV','Randers NØ','Randers SV','Randers SØ',
      'Ranum','Rask Mølle','Redsted M','Regstrup','Ribe','Ringe','Ringkøbing','Ringsted','Risskov','Risskov Ø',
      'Risskov Ø','Roskilde','Roslev','Rude','Rudkøbing','Ruds Vedby','Rungsted Kyst','Ry','Rynkeby','Ryomgård',
      'Ryslinge','Rødby','Rødding','Rødekro','Rødkærsbro','Rødovre','Rødvig Stevns','Rømø','Rønde','Rønne',
      'Rønnede','Rørvig','Sabro','Sakskøbing','Saltum','Samsø','Sandved','Sejerø','Silkeborg','Sindal',
      'Sjællands Odde','Sjølund','Skagen','Skals','Skamby','Skanderborg','Skibby','Skive','Skjern','Skodsborg',
      'Skovlunde','Skælskør','Skærbæk','Skævinge','Skødstrup','Skørping','Skårup Fyn','Slagelse','Slangerup','Smørum',
      'Snedsted','Snekkersten','Snertinge','Solbjerg','Solrød Strand','Sommersted','Sorring','Sorø','Spentrup','Spjald',
      'Sporup','Spøttrup','Stakroge','Stege','Stenderup','Stenlille','Stenløse','Stenstrup','Stensved','Stoholm Jyll',
      'Stokkemarke','Store Fuglede','Store Heddinge','Store Merløse','Storvorde','Stouby','Strandby','Struer','Strøby','Stubbekøbing',
      'Støvring','Suldrup','Sulsted','Sunds','Svaneke','Svebølle','Svendborg','Svenstrup J','Svinninge','Sydals',
      'Sæby','Søborg','Søby Ærø','Søllested','Sønder Felding','Sønder Omme','Sønder Stenderup','Sønderborg','Søndersø','Sørvad',
      'Taastrup','Tappernøje','Tarm','Terndrup','Them','Thisted','Thorsø','Thyborøn','Thyholm','Tikøb',
      'Tilst','Tim','Tinglev','Tistrup','Tisvildeleje','Tjele','Tjæreborg','Toftlund','Tommerup','Toreby L',
      'Torrig L','Tranbjerg J','Tranekær','Trige','Trustrup','Tune','Tureby','Tylstrup','Tølløse','Tønder',
      'Tørring','Tårs','Ugerløse','Uldum','Ulfborg','Ullerslev','Ulstrup','Vadum','Valby','Vallensbæk',
      'Vallensbæk Strand','Vamdrup','Vandel','Vanløse','Varde','Vedbæk','Veflinge','Vejby','Vejen','Vejers Strand',
      'Vejle','Vejle Øst','Vejstrup','Veksø Sjælland','Vemb','Vemmelev','Vesløs','Vestbjerg','Vester Skerninge','Vesterborg',
      'Vestervig','Viborg','Viby J','Viby Sjælland','Videbæk','Vig','Vildbjerg','Vils','Vinderup','Vipperød',
      'Virum','Vissenbjerg','Viuf','Vodskov','Vojens','Vonge','Vorbasse','Vordingborg','Vrå','Væggerløse',
      'Værløse','Ærøskøbing','Ølgod','Ølsted','Ølstykke','Ørbæk','Ørnhøj','Ørsted','Ørum Djurs','Østbirk',
      'Øster Assels','Øster Ulslev','Østermarie','Østervrå','Åbyhøj','Ålbæk','Ålsgårde','Århus C','Århus N','Århus V', 'Årre','Årslev'
    ]
  end
end



