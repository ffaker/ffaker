module Faker
	
	# => Generates names from Gambia West Africa
	# 		source: http://www.columbia.edu/~msj42/Common%20Gambian%20First%20Names.htm
	#
	module NameGA
	
	    extend ModuleUtils
	    extend self

	    # => CONSTANTS
	    #
	    FIRST_NAMES_FEMALE = k %w(Abie Adama Adu Aisha Allabatou Allamouta AllimatouAmie Aminata Ancha Anna Anta Aram Aret Arookee  Asanatou Atta Ayi Balankang Banna  Beteng Bijilo Bin Binneh Binet Binta Bintanding Bintu Boneh Bori Ceesaynding Charlotte Christine Corina Coumba Coura Daggah Daado Daniela Danjang Dawitt Denise Dolly Donna Elaine Ellen Eli Elisa Elizabeth Enna Fama Fanna Fanta Fatamina Fatma Fatoumata Fatou Fatunding Fara Fayel Frances Fulatunk Funtufaye Galo Gaye Gegeh Georgina Gidera Gindereh Babibatou Hajarta Hallima Hamisowe Hanna Hariette Hellen Hoja Horeja Houdja Houmou Hoyaan Huja Huri Ida Isatou Jaboh Jabou Jaherr Jajeh Jall Jalika Jalnum Jamba Jamos Jankay Janun Jarai Jaria Jariatou Jidereh Kaddy Kafa Kandar Kandeh Kani Kanja Kanjumblaank Kassamanding Kinti Kodou Kujayjah Kumareh Kunkung Kurou Kuura Kaani Lena Lisa Lobe Lolong Lolo Madeghen Mai Maimuna Mairam Majula Mam Mamandew Mambisinnine Mankita Mansata Margaret Marget Mariatu Mariama Mariam Marie Mary Manyimba Mbasey Mbayam Mbene Mberegaye Mberi Mbinga Mbinkinding Mbissine Momkan Musubanding Musukoi Musukoto Musukuta Maaluta Naffie Natoma NBene Ndiabou NGat Nano Ndey Ndingbo Ndura Nenegalleh Ngenarr Ngilan Ngoneh Njaling Njarram Njemeh Njonkoling Nkey Nogoy Numbeh Nyakasi Nyaling Nyanya Nyillan Nyima Obaar Olaye Oli Olimatta Olimatou Ousainatou Penda Rabbi Regina Rokhia Rohe Ruggie Saffie Sainabou Sanjani Sanou Saribaa Saribanding Sarata Saratou Saro Satang Satunding Siffaye Sigga Sirando Sirreh Soda Soffie Sonna Sora Sukai Suna Sunkang Tamara Tano Tasatou Tida Tiya Tuti Veronica Victoria Wuday Yadikon Yakay Yama Yandeh Zainab)
	    FIRST_NAMES_MALE   = k %w(Abba, Abdoulaye, Adama, Ajuma, Alasana, Alboury, Alfusainou, Alkalo, Alex, Alieu, Allabatou, Allamouta, Almami, Almamo, Amadou, Amata, Anthony, Appaye, Araba, Ayyah, Aziz Baba, Baba Galleh, Baboucar, Badara, Bairo, Bakary, Balankang, Balla, Bamara, Bamba, Banjuku, Basirou, Bechou, Benedict, Benjamin, Bolla, Biji, Booti, Bora, Boto, Booya, Buba, Bubacarr, Buka, Bulley, Bun, Bunja, Buray, Bye, Chabba, Chambi, Chana, Charles, Charneh, Cheboh, Cheikh, Christopher, Correa, Daniel, Daraman, Dekory, Demba, Dembo, Deguman, Desmon, Dominick, Dulla, Durang, Duwa Ebin, Ebou, Ebrima, Edrisa, Edward, Eggeh, Emanuel, Ekku, Fabala, Fafanding, Fakebba, Falla, Fallou, Fanding, Fansaine, Fara, Faranding, Farimang, Findi, Foday, Folongko, Fransis Gabi, Garba, Galo, George, Giddo, Gidom, Gregory, Gondoi, Gorra Hadim, Halifa, Hamadi, Haruna, Henry, Houn, Hoyan Ibrahim, Ibou, Ignatius Jabel, Jahu, Jalang, Jalima, Jallom, James, Jamos, Jatta, Jatto, Jemussu, Jerreh, Jewru, Jidere, Jirang, Joseph, Juldeh, Jung, Jungkunda, Junkung Kajaly, Kalilu, Kamuneh, Kanimang, Kanjura, Karamba, Karankallo, Karanlang, Karanta, Karrafa, Katim, Kawsu, Kaykoto, Kayluntang, Kayring, Kebba, Kebuteh, Kekoi, Kemesseng, Kemeta, Kemo, Kemoring, Kemoba, Kenbugut, Kenbugul, Ketabou, Kewuleng, Kitim, Koora, Koro, Kulubo, Kuto, Kutobo Laity, Lalo, Landing, Lang, Larry, Latjor, Latri, Leemu, Lensa, Loloh, Lolon Maamina, Maari, Madehgen, Madi, Madiba, Madikeh, Majorr, Malal, Malanding, Malaw, Malick, Mamadi, Mamar, Mamburray, Mamo, Mamudu, Mamur, Manlafy, Mansor, Maoyatou, Masamba, Massaneh, Mawdo, Mayekor, Mba, Mbarka, Melbourey, Michael, Mohammad, Moli, Mom, Momat, Momkan, Momodou, Moses, Mot, Mounir, Mufri, Musa, Mustapha Nathaniel, Nfally, Nfamara, Nfansu, Njuga, Naibelle, Ndongo, Nduggu, Ngattan, Ngoja, Ngor, Njagga, Numu, Nyanya Oliver, Omar, Ousainou, Ousman Pateh, Patrick, Peter, Philip, Pili Rabbi, Richard, Roger, Roddie Saaki, Saako, Saderr, Saiarr, Saidou, Saikou, Sainey, Sait, Sajaa, Sajo, Salmina, Samaba, Samba, Sambou, Samory, Samuel, Sana, Sanballa, Sanjally, Sanjani, Sanji, Sankung, Sawalo, Seedy, Sayer, Seckka, Sengan, Sherrif, Sidia, Sinajo, Siman, Sirach, Sittafa, Suntu, Saangone, Sylvester, Solomon, Sora, Stephen, Steve, Sulayman, Sumbundu, Sutay, Sutura, Sutunkung Tam, Tamba, Tamsir, Tanu, Tijan, Theodore, Tom, Turo, Tombong Victor, Vincent William, Willie Yanding, Yahya, Yelee, Yeyeh, Yob, Yugo)
	    PREFIX_FEMALE      = k %w()
	    PREFIX_MALE        = k %w()
	    LAST_NAMES         = k %w(jammeh ceesay)

	    # => METHODS

	    def first_name_female
	    	FIRST_NAMES_FEMALE.rand
	    end

	    def first_name_male
	    	FIRST_NAMES_MALE.rand
	    end

	    def last_name
	    	LAST_NAMES.rand
	    end

	    def name_male
	    	"#{first_name_male} #{last_name}"
	    end

	    def name_female
	    	"#{first_name_female} #{last_name}"
	    end

	    def name
	    	case rand(10)
	    		when 9 then name_female
	    		when 8 then name_male
	    		when 7 then name_female
	    		when 6 then name_male
	    		when 5 then name_female
	    		when 4 then name_male
	    		when 3 then name_female
	    		when 2 then name_male
	    		else name_female
	    	end
	    end

	end

end