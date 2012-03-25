# encoding: utf-8

# => author: PapePathe github.com/PapePathe
# => email: pathe.sene@gmail.com

# => the names & first names in this module were found at this url : http://www.senegalaisement.com/senegal/noms_et_prenoms.html

module Faker
  module NameSN
    extend ModuleUtils
    extend self

    # Females
    #
    PREFIX_FEMALE      = k %w(adja adjaratou mame ndeye)
    FIRST_NAMES_FEMALE = k %w( Abibatou Aby Absa Adama Adiouma Adji Adja Aïcha Aïda Aïssatou Akinumelob Alima Alimatou Alinesiitowe Aloendisso Altine Ama Aminata Aminta Amy Amina Anta Arame Assa Assietou Astou Ata Atia Awa Awentorébé Ayimpen Banel Batouly Bigué Billé Binta Bineta Binette Binta Bintou Borika Bougouma Boury Bousso Ciramadi Codou Combé Coudouution Coumba Coumboye Coura Daba Dado Daka Debbo Défa Dewel Dewene Diakher Diakhou Dialikatou Dianké Diariatou Diarra Diary Dibor Dieourou Dior Diouma Djaly Djébou Djeynaba Dkikel Djilane Enfadima Fabala Fabinta Fadima Fakane Fama Fanta Farmata Fatima Fatou Fatoumatou Fily Garmi Gnagna Gnilane Gnima Gouya Guignane Guissaly Haby Hawa Heinda Holèl Issate Kankou Karimatou Kenbougoul Kéwé Kadiali Khadija Khadijatou Khady Khar Khary Khayfatte Khoudia Khoudjedji Khoumbaré Kiné Korka Laf Lama Léna Lika Lissah Liwane Mada Madior Madjiguène Maguette Mahawa Mame Mamina Manthita Marème Mariama Mamassa Mane Maty Mayatta Maymouna Mbarou Mbayeng Mbissine Mbossé Mingue Mintou Mouskéba Nafi Nbieumbet Ndella Ndeye Ndiarenioul Ndiasse Ndiaty Ndiémé Ndioba Ndiolé Ndioro Ndombo Néné Neyba Ngoné Ngosse Nguenar Nguissaly Niakuhufosso Niali Nialine Ningou Nini Niouma Oulèye Ouly Oulimata Oumou Oumy Oureye Penda Raby Raki Rama Ramatoulaye Ramata Rokhaya Roubba Roughy Sadio Safiétou Safi Sagar Sahaba Salimata Salamata  Sanakha Sarratou Saoudatou Sawdiatou Selbé Sell Seynabou Seyni Sibett Siga Sira Sirabiry Soda Sofiatou Sofietou Sokhna Souadou Soukeye Soukeyna Tabara Tacko Taki Tening Téwa Tiné Thiomba Thiony Thioro Thioumbane Tocka Tokoselle Toly Walty Yadicone Yacine Yandé Yaye )

    # Males
    #
    PREFIX_MALE       = k %w(pape eladji mame serigne)
    FIRST_NAMES_MALE  = k %w( Abba Abdallah Abdou Abdoulatif Abdoulaye Abdourahmane Ablaye Abou Adama Agouloubene Aïnina Aladji Alassane Albouri Alfa Alfousseyni Aliou Alioune Allé Almamy Amadou Amara Amath Amidou Ansoumane Anta Arfang Arona Assane Ass Aziz Baaba Babacar Babou Badara Badou Bacar Baïdi Baila Bakari Ballago Balla Bamba Banta Bara Bassirou Bathie Bayo Becaye Bilal Biram Birane Birima Biry Bocar Bodiel Bolikoro Boubacar Boubou Bougouma Bouly Bouna Bourkhane Bransan Cheikh Chérif Ciré Daly Dame Daouda Daour Demba Dényanké  Diakhou Dial Dialamba Dialegueye Dianco Dicory Diégane Diène Dierry Diokel Diokine Diomaye Djibo  Djibril Djiby Doudou Dramane ElHadj Elimane Facourou Fadel Falilou Fallou Famara Farba Fatel Fodé Fodey Fodié Foulah Galaye Gaoussou Gora Gorgui Goumbo Goundo Guidado Habib Hadiya Hady Hamidou Hammel Hatab Iba Ibrahima Ibou Idrissa Insa   Ismaïl                        Ismaïla Issa Isshaga Jankebay Jamuyon Kader Kainack Kalidou Kalilou Kambia Kao Kaourou  Karamo Kéba Khadim Khadir Khalifa Khamby Khary Khoudia Khoule Kor Koutoubo Lamine Lamp Landing Lat Latif Latsouck Latyr Lémou Léou Leyti Libasse Limane Loumboul Maba Macky Macodou Madia Madické Mady Mactar Maffal Maguette Mahécor Makan Malal Malamine Malang Malaw Malick Mallé Mamadou Mamour Mansour Maodo Mapaté Mar Massamba Massar Masseck Mbagnick Mbakhane Mbamoussa Mbar Mbaye Mébok Médoune Meïssa Modou Moktar Momar Mor Mountaga Moussa Moustapha Namori Ndane Ndiack Ndiaga Ndiankou Ndiaw Ndiawar Ndiaya Ndiogou Ndiouga Ndongo Ngagne Ngor Nguénar Niakar Niankou Niokhor Nouh Nouha Npaly Ogo Omar Opa Oumar Oury Ousmane Ousseynou  Papa Pape Papis Pathé Racine Sadibou Sacoura Saër Sahaba Saïdou Sakhir Salam Salif Saliou  Saloum Samba Samori Samsidine Sandigui Sankoun Sanokho Sécouba Sédar Sékou Semou Senghane Serigne Seyba Seydina Seydou Sibiloumbaye Sidate Sidy Siéka Sihalébé Sihounke Silly Socé Sogui Soireba Solal  Sonar Souleymane Soundjata Sounkarou Souty Tafsir Talla Tamsir Tanor Tayfor Tekheye Tété Thiawlo Thierno Thione Tijane Tidjane Toumani Vieux Wagane Waly Wandifing Wasis Woula Woury Yacouba Yafaye Yakou Yankhoba Yerim Yero Yoro Yougo Younouss Youssou Yussu Youssoufa )

    # Last Names
    #
    LAST_NAMES        = k %w( Badji Badiatte Badji Biagui Bassène Bodian Coly Diamacoune Diatta Diadhiou Diédhiou Deme Diémé Djiba Ehemba Goudiaby Himbane Mané Manga Sagna Sambou Sané Sonko Tamba Tendeng Badji Gomis Mané Vieira Carvalho Mendy Mané Preira Correia Basse Sylva Da_Sylva Fernandez Da_Costa Bakhoum Diop Diagne Gaye Gueye Ndoye Ndiour Samb Baloucoune Bandiacky Boissy Diompy Dupa Kabely Kaly Kantoussan Kassoka Kayounga Keny Malack Malèle Malomar Malou Mandika Mandiouban Mancabou Mantanne Mbampassy Médou Minkette Nabaline Nadiack Napel Ndecky Ndeye Niouky Ntab Nzale Panduppy Samy Boubane Bonang Bianquinch Bindian Bendian Bangonine Bapinye Bidiar Bangar Sadio Vieira Lopez Marques Preira Ndiaye Diouf Ndong Dioh Senghor Faye Dior Dione Seye Diongue Sene Dieye Sarr Seck Diaher Bop Kitane Kital Acc Aïdara Athie Aw Ba Baby Baldé Barro Barry Bathily Bousso Camara Cissé Dia Diamanka Diallo Diao Diaw Fassa Fofana Gadio Galadio Kâ Kane Maal Mbow Lo Ly Sall Seydi Sow Sy Sylla Tall Thiam Wane Wone Yock Amar Babou Diagne Diakhoumpa Goumbala Saady Sabara Sougou Sougoufara Tandiné Tandini Touré Diandy Aïdara Bathily Camara Cissé Cissoko Coulibaly Dabo Doumbia Doumbouya Diabang Diakhaté Diabira Diakité Dansokho Diakho Diarra Diawara Djimera Dramé Doucouré Fadiga Fofana Gakou Gandega Kanté Kanouté Keïta Koïta Konaté Niangane Sadio Sakho Samassa Sawane Sidibé Sissoko Soumaré Tandjigora Timera Traoré Touré Wagué Yatéra Boye Demba Dembelé Diack Diarra Dieng Diop Fall Gningue Hanne Kane Kassé Lèye Loum Marone Mbacké Mbathié Mbaye Mbengue Mbodj Mbodji Mboup Mbow Ndao Ndaw Nder Ndiaye Ndour Niane Niang Niass Niasse Pouye Seck Sock Taye Thiam Thiongane Wade )

    # randomized? (senegalese) last_name!
    #
    def last_name
      LAST_NAMES.rand
    end

    # randomized? (senegalese) male first_name!
    #
    def first_name_male
      FIRST_NAMES_MALE.rand
    end

    # randomized? (senegalese) female first_name!
    #
    def first_name_female
      FIRST_NAMES_FEMALE.rand
    end

    # randomized? (senegalese) male prefix!
    #
    def prefix_male
      PREFIX_MALE.rand
    end

    # randomized? (senegalese) female prefix!
    #
    def prefix_female
      PREFIX_FEMALE.rand
    end

    # => randomized. (senegalese) male name
    #
    def name_male
      case rand(10)
        when 7 then "#{prefix_male} #{first_name_male} #{last_name}"
        when 5 then "#{prefix_male} #{first_name_male} #{last_name}"
        when 3 then "#{first_name_male} #{last_name}"
        when 0 then "#{first_name_male} #{last_name}"
        else        "#{first_name_male} #{last_name}"
      end
    end

    # => randomized. (senegalese) female name
    #
    def name_female
      case rand(10)
        when 7 then "#{prefix_female} #{first_name_female} #{last_name}"
        when 5 then "#{prefix_female} #{first_name_female} #{last_name}"
        when 3 then "#{first_name_female} #{last_name}"
        when 0 then "#{first_name_female} #{last_name}"
        else        "#{first_name_female} #{last_name}"
      end
    end

    def name_sn
      case rand(10)
        when 7 then "#{prefix_female} #{first_name_female} #{last_name}"
        when 5 then "#{prefix_male} #{first_name_male} #{last_name}"
        when 3 then "#{first_name_male} #{last_name}"
        when 3 then "#{first_name_female} #{last_name}"
        when 0 then "#{first_name_male} #{last_name}"
        else        "#{first_name_female} #{last_name}"
      end
    end
  end
end
