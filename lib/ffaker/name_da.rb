module Faker
  module NameDA
    include Faker::Name
    extend ModuleUtils
    extend self

    def name gender = :any
    	case gender
    	when :any then any_name
    	when :male then male_name
    	when :female then female_name
    	else
    		raise ArgumentError, "Invalid gender, must be one of :any, :male, :female"
    	end
    end

    def any_name
      case rand(8)
      when 0 		then 	"#{prefix} #{first_name} #{last_name}"
      when 1..2 then 	"#{first_name} #{last_name} #{last_name}"
      else 	  				"#{first_name} #{last_name}"
      end
		end    	

		def male_name
			fname = first_name :male
      case rand(8)
      when 0 		then 	"#{prefix} #{fname} #{last_name}"
      when 1..2 then 	"#{fname} #{last_name} #{last_name}"
      else 						"#{fname} #{last_name}"
      end			
		end

		def female_name
			fname = first_name :female
      case rand(8)
      when 0 		then 	"#{prefix} #{fname} #{last_name}"
      when 1..2 then 	"#{fname} #{last_name} #{last_name}"
      else 						"#{fname} #{last_name}"
      end			
		end

    def first_name gender = :any
    	fname = first_name :male
    	case gender
    	when :any then FIRST_NAMES.rand
    	when :male then MALE_FIRST_NAMES.rand
    	when :female then FEMALE_FIRST_NAMES.rand
    	else
    		raise ArgumentError, "Invalid gender, must be one of :any, :male, :female"
    	end
    end

    def last_name
      LAST_NAMES.rand
    end

    def prefix
      PREFIXES.rand
    end

    MALE_FIRST_NAMES = k ["Ab", "Abel", "Abdikheyr","Abdillahi","Abdiqadir","Abdirahman","Abnir","Addis","Adiva","Aftab","Aimal","Ajeeshan","Ajuna","Akachi","Akon","Alasdair","Albertinus","Alix","Amiin","Amren","Anaz","Andriy","Andry","Annæus","Ansumana","Antonio","Apollo","Araz","Armaandeep","Artur","Atshey","Attila","Aurel","Avraz","Awais","Azis",
    	"Babatunde","Balzer","Baqar","Barbaros","Barca","Batin","Berkin","Berndt","Bertier","Bille","Boniface","Brianeli","Brido","Brono","Burim","Butoto","Buzter",
    	"Cayden","Cevat","Chay","Cheick","Chico","Chidozie","Cilan","Clauz","Cormac","Cömert", "Christian", "Dae","Dagim","Darnel","Dennik","Dero","Deyyan","Dogukan","Dominick","Dreas","Dynnes","Eberhardt","Edon","Eick","Eiler","Einert","Eitel","Elarbi","Eldin","Elwin","Emal","Emilis","Emre","Enoch","Erem","Ersan",
    	"Falah","Falke","Fardin","Felan","Fester","Finnbjørn","Fir","Frorai","Galad","Gary","Gerald","Germann","Germind","Gharib","Gniewko","Greg","Günther","Gøtz",
    	"Haggi","Hailo","Hakon","Hans", "Haqmal","Haraldur","Haroot","Hedi","Helfred","Helton","Henrick","Hercules","Heri","Hjalti","Hodja","Honza","Hoya","Hunter","Huu","Huy","Hydar","Haakon",
    	"Iannis","Idan","Ilie","Ilkcan","Ingemar","Ingmar","Ingvald","Isaías","Issak","Istvan","Isaali","Izat","Jacko","Jaime","Janius","Jarno","Jeak","Jerzy","Jesu","Jesuran","Jogvan","Johann","Johnes","Jónatan","Jordan","Jorik","Junes","Juntao","Jørn",
    	"Karl", "Kangolo","Kave","Kayembe","Kazam","Kerry","Kewin","Kheir","Khudhur","Kilian","Kimo","Kobe","Korhan", "Kristian", "Kuku","Kåre","Lage","Laith","Lali","Lauge","Leenus","Leonid","Levi","Lior","Logan","Long","Lorry","Lowrance","Lozang","Lurifax","Luuk","Luuka",
    	"Madar","Mahdy","Mahed","Maico","Majad","Maksen","Margus","Marley","Masafumi","Mathew","Mathiias","Mati","Mattias","Mattis","Maxian","Maysam","Medin","Meick","Mek","Merlan","Merlin","Messi","Michas","Miggi","Mika","Mikael","Mikk","Mikkell","Minato","Moez","Mohamad","Mohamedburhan","Momin","Morgan","Mortan","Moslem","Mouhammad","Mousa","Mowlid","Muhanad","Munasar","Mushtaq","Musse",
    	"Nadhim","Nait","Nanoq","Nasar","Neal","Nebo","Nedin","Neshan","Nevil","Nickolej","Nikky","Nileshan","Nilias","Nithush","Nurdin","Nuri","Ny","Nökkvi","Odai","Olliwer","Oluwalanaire","Omotayo","Onesimos","Orhan","Osvaldus","Pak","Papa","Parvel","Parvez","Patrekur","Paul-Erik","Pavith","Petter","Philipp","Phinneas","Phung",
    	"Platon","Polle","Pæshang","Qadar","Qassem","Quando","Raheim","Ramazan","Rames","Ramsey","Ranj","Raymont","Reda","Regont","Reihdar","Rejmar","Renaldas","Rian","Robbert","Rued","Rupendra","Ryta","Saban","Sada","Sahib","Saif","Salih","Salko","Sanjin","Sayid","Sayjon",
    	"Sebastean","Sein","Selmer","Semir","seph","Sergiy","Shahid","Shajan","Shamal","Sharuson","Shuo","Si","Sijiang","Silverio","Sipan","Sjurður","Steinar","Stephaan","Subhaan","Sun","Suren","Sveinn","Svevo","Tabo","Tadeas","Tahsin","Tamer","Tancred","Taner","Taulant",
    	"Tesser","Thawng","Theodoros","Therkil","Thony","Thorlak","Thorvild","Thuan","Tian","Tieno","Timm","Tjahed","Tolle","Tolver","Tomás","Tonny","Tor","Torfinn","Torvil","Travis","Trent","Triztan","Tuala","Turan","Turgay",
    	"Ugli","Úlfur","Umberto","Valfred","Varnaan","Vaughn","Venny","Vigo","Villas","Vinjar","Vinu","Wahaab","Walied","Wassily","Wenkai","Winno","Witte","Xenius","Xinyao","Yaki","Yalcin","Yaman","Yassen","Yasser","Yassier","Yngwie",
    	"Zaid","Zamann","Zamuel","Zaydan","Zeddy","Zhwan","Zilaz","Zillas","Zoltan"
    ]

    FEMALE_FIRST_NAMES = k [
			"Abelone","Abishna","Abraar","Acaylia","Addi","Adelfine","Adeliin","Adhina","Adia","Aisa","Aishwaryar","Ajla","Akuye","Albine","Allydia","Amela","Amélie","Amineh","Ampong","Anabita","Anantika","Anastasiya","Anastasja","Anatasie","Andorthe","Anedorte","Anelela","Anell","Anesa","Angeliki","Ani","Anjelica","Annalee","Annaline","Annamaya","Anne-Mie","Annekarin","Annekarinna","Annelisa","Annelouiise","Anniceta","Anniek","Anya","Aputsiaq","Arathana","Aribah","Arnóra","Asenath","Asthrid","Asu","Athena","Atiya-Tul","Atlante","Audrey","Audreyanne","Avin","Awatif","Baele","Basik","Baukje",
			"Be","Beathe","Bejan","Belén","Bellakarla","Benda","Benditte","Bengta","Berta","Biak","Bianna","Bibba","Birgitanilla","Birret","Bismee","Bodil","Bothilia","Brenda","Brescia","Bria","Camelie","Cami","Canelita","Cang","Cannie","Cayenne","Chanelli","Chasmin","Chepkoech","Chili","Chrisanne","Christin","Chrysahne","Chrysanta","Chun","Claudiane","Clennie","Constantina","Cubamari","Curie","Cæcilie","Daina","Daiomi","Dalya","Deia","Delta","Deqa","Deva","Dilan","Diljá","Dilys","Dineke","Dionysia",
			"Domenika","Dominique","Dorette","Dung","Döne","Ebbakia","Eleana","Elejnia","Elenore","Elín","Ellah","Elodie","Elvine","Elvire","Elwira","Emilee","Emmelin","Enid","Ennike","Enyo","Ephra","Eretha","Erika","Esaura","Esmee","Esra","Eva-Maria","Fahima","Faiza","Farishta","Faten","Feben","Felia","Fillipa","Fitore","Florette","Francesca","Francini","Frencia","Fridamarie","Frigerd","Frøya","Funda","Gazal","Gazala","Gena","Getha","Ghada","Ginger","Gizem","Gjyzide","Gofran","Grada","Grusje","Gulney","Gun",
			"Gunvor","Habib","Hadishta","Haessal","Hafsah","Halima","Hanka","Hanne-Marie","Harena","Hasanat","Heerthdana","Henriette","Herle","Hiam","Hikma","Idun","Ifrah","Ikiuna","Iliriana","Ilmur","Inaya","Ingear","Ingelil","Ingelina","Inger-Lis","Ingibjörg","Ione", "Irela","Irini","Isalina","Iselinn","Isobell","Jamile","Jamina","Janaya","Janette","Janini","Janne","Jawan","Jerie","Jestelina",
			"Jethe","Jirina","Jonna","Josa","Jostina","Juweeriya","Jytthe","Jørna","Kadja","Kadla","Kahina","Kaja","Kali","Kamilia","Kamilla","Karianne","karinasofia","Karma","Kasina","Katarin","Katherin","Kazime","Kecia","Kerstinne","Kiea","Kiritin","Kisa","Kristense","Kristjana","Kulthum","Laiila","Laina","Laisa","Lalbibi","Lamar","Lavanya","Lawan","Layan","Leanette","Leenamari","Lela","Leonor",
			"Lida","Liisa","Lika","Lilse","Lisen","Lizi","Loa","Lonai","Lorenze","Loulie","Lucija","Lullu","Lusy","Lyudmyla","Maddie","Mahboobeh","Mahnaz","Maiasoffi","Maibritt","Majabrith","Majalisa","MajaMarie","Malizia","Mamoona","Marenta","Marentine","Margreta","Margrete","Marieann","Marinette","Marjun","Marlin","Marliz","Marwo","Maryanruun","Marysia","Maryzia","Masume","Mathilde","Mazcha","Medya","Mekana","Melani","Meliah","Melin","Mellisa","Mercedez","Meri",
			"Metea","Mette-Louise","Miall","Mica","Milina","Mimi","Min","Minika","Minna","Minnie","Minot","Mirthe","Monisha","Mudan","Mugisha","Muzdalifa","Mwiinga","Müberra","Münevver","Mythily","Nadeena","Nahide","Najaad","Nanda","Naserian","Nastasia","Nazreen","Nee","Neeline","Neia","Neimi","Nella","Nenne","Neval","Ngan","Nhea","Nicolie","Nif","Njeri","Njike","Nnaba","Noella","Noma","Nupel","Offodjé","Ojetta","Olivia",
			"Oluffa","Osayuki","Othilie","Pabodhi","Pandora","Perla","Persille","Peytons","Phillippa","Piatilde","Piya","Polonia","Pranatda","Premasha","Priscilla","Qaymayriyah","Rabena","Rania","Razan","Rennette","Ridwan","Rikkemaria","Rinie","Ritazol","Ritva","Robine","Rojbin","Roksana","Roopraj","Rosemaya","Raamin","Saffron","Salca","Salima","Salomine","Salwa","Sama","Samanda","Samaya","Sanela","Sayna","Saynabou","Sedsel","Seia","Selen","Selinda","Selvi","Senia","Serafine",
			"Sette","Seynab","Shahin","Shahzadi","Shaima","Shams","Sharmi","Shela","Shessa","Shpresa","Shriti","Sibelle","Siddiqa","Sido","Sighrid","Sinnika","Sintta","Sizze","Sol","Sólrún","Star","Stasia","Stenja","Stisser","Stivelle","Suchitra","Suleima","Sumayyah","Suszy","Suzanne","Syp","Sølvi","Sønnøve","Søvrine","Tae","Tahereh","Tanaz","Tara","Tasneem","Tatiana","Tchila","Teri","Tessa","Thelse","Thordiis","Tidde","Tinamia","Titania",
			"Tong","Tovelisse","Triesse","Trisja","Tristin","Truste","Tuong","Valja","Valnesa","Vanesa","Varshini","Vernice","Vibika","Vichi","Vilhelmine","Ville","Vimbiso","Vinda","Violetta","Vivi","Wardah","Wega","Welphy","Wesakha","Winnia","Xaji","Xingchen","Xiomara","Xue","Yasmin","Yetta","Yin","Yuhan","Yulanda","Yuqing","Zada","Zarghunah","Zecilie","Zenta","Zienna","Zihan","Zikan","Zilvia","Ziva","Æsa","Özlam","Aanya","Aasiya"
    ]

    FIRST_NAMES = BOY_FIRST_NAMES + GIRL_FIRST_NAMES

    LAST_NAMES = k [
    	"Ahmed","Ali","Andersen","Andersson","Andreasen","Andreassen","Andresen","Asmussen",
    	"Bach","Bak","Bang","Bech","Beck","Bendtsen","Berg","Bertelsen","Berthelsen","Bisgaard","Bisgård","Bjerre","Bjerregaard","Bjerregård","Bonde","Brandt","Brodersen","Bruun","Buch","Bundgaard","Bundgård","Carlsen",
    	"Carstensen","Christensen","Christiansen","Christoffersen","Clausen","Dahl","Dalgaard","Dalgård","Dalsgaard","Dalsgård","Dam","Damgaard","Damgård","Danielsen","Davidsen","Enevoldsen","Eriksen","Eskildsen","Fischer","Frandsen",
    	"Frederiksen","Friis","Frost","Gade","Gregersen","Hald","Hansen","Hedegaard","Hedegård","Hemmingsen","Henningsen","Henriksen","Hermansen","Hjorth","Hoffmann","Holm","Holst","Hougaard","Hougård","Ibsen","Iversen","Jacobsen","Jakobsen",
    	"Jensen","Jeppesen","Jepsen","Jespersen","Jessen","Johannesen","Johannsen","Johansen","Johansson","Johnsen","Juhl","Justesen","Juul","Jønsson","Jørgensen","Karlsen","Kirkegaard","Kjeldsen","Kjær","Kjærgaard","Kjærgård","Klausen","Knudsen",
    	"Koch","Kofoed","Kragh","Kristensen","Kristiansen","Kristoffersen","Krog","Krogh","Kruse","Lange","Larsen","Lassen","Lauridsen","Lauritsen","Lauritzen","Laursen","Laustsen","Leth","Lind","Lorentzen","Lorenzen","Lund","Madsen","Markussen",
    	"Mathiasen","Mathiesen","Meyer","Michelsen","Mikkelsen","Mogensen","Mortensen","Munk","Müller","Mølgaard","Mølgård","Møller","Nguyen","Nielsen","Nikolajsen","Nilsson","Nissen","Nygaard","Nygård","Nørgaard","Nørgård","Olesen","Olsen","Olsson",
    	"Overgaard","Overgård","Paulsen","Pedersen","Persson","Petersen","Poulsen","Rasmussen","Ravn","Riis","Schmidt","Schou","Schrøder","Schultz","Simonsen","Skov","Sloth","Sommer","Steffensen","Svendsen","Svensson","Søgaard","Søgård","Søndergaard",
    	"Søndergård","Sørensen","Thomassen","Thomsen","Thorsen","Thygesen","Thøgersen","Toft","Vestergaard","Vestergård","Villadsen","Vinther","Winther","Østergaard","Østergård","Aagaard","Aagård","Ågård","Ågaard"
    ]

    PREFIXES = k %w(Hr. Fr. Dr. Prof.)
  end
end
