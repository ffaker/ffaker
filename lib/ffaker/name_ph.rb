# encoding: utf-8

require 'ffaker'

# Philippine names based on http://en.wikipedia.org/wiki/Philippine_name
module Faker
  module NamePH
    include Faker::Name
    extend ModuleUtils
    extend self

    def last_name
      case rand(2)
      when 0
        AUTOCHTHONOUS_SURNAMES.rand
      else
        SPANISH_SURNAMES.rand
      end
    end

    def name
      case rand(9)
      when 0 then "#{prefix} #{first_name} #{last_name}"
      else        "#{first_name} #{last_name}"
      end
    end

    AUTOCHTHONOUS_SURNAMES = k %w[
      Abaygar Abucay Abrogar Abulog Adona Agatep Agbayani Alimboyugen Almazan
      Allanic Alupay Ahkiong Amora Amurao Baal Baang Baldedara Baltar Balignasay
      Batungbakal Barrometrog Bello Biag Biglang-Awag Bilatan Bongalos Bitaog Butil
      Cabatingan Cabigas Cagas Calapatia Camat Canumay Carandang Casicas Catacutan
      Cawayan Cayawan Cayubyub Cojuangco Chincuanco Chuchu Cuyegkeng Dacudag Dacudao
      Dagalag Dahil-Dahilg Dahilang Daplas Dimaanog Dimaguibag Dimaunahang Dinlayan
      Dioquino Divero Dumaloan Dumalahay Dysangcog De Cedidomutila Gabuat Galitg
      Gallano Gatan Gosiengfiao Gubatg Guimatao Guintog Dinguinbayan Dyquiangco
      Humilde Ifugao Ilaban Japos Kalawakang Kanaway Kaunlarang Kulikutang Kulubotg
      Kumulitog Labasang Labongg Lacro Lao-laog Lazaro Lemoncito Limbudan Limcuando
      Linganyan Luso-Luso Macawili Macaraeg Macaspac1 Macalipay Madlambayan
      Madlangbayan Magan Magalingg Magbantayg Magbanua Magday Magdiwangg Maglikian
      Magnaye Magos Magpantayg Magpulongg Magsaysayg Mahiyag Makabaligoten Makadaang
      Malit Manansala Manyakesg Marapao Matapangg Makisigg Malakig Maputig Maitimg
      Maliitg Masipagg Matiyagag Malagar Mangsinco Magsino Murro Navea Labuguen Lantag
      Limbaco Limcangco Limuaco Loshangg Luansing Olan Ongpauco Ongsioco Otogan
      Pabalan Paca Pagsisihang Paloma Paña Panonce Patanindagat Paragili Parsaligan
      Pecore Peria Pilapil Pildilapil Pinagbuklodg Pinagdamutan Pinagpalag Quiambao
      Relano Reotutarg Santos Sariwa Sariuag Salem Salumbidez Sarte Sese Sinagtala
      Sipsipg Siapuatco Simangan Simsuangco Solmorog Songcuya Sumague Supsup Sydiongco
      Syjuco Sytengco Subrabas Tabilla Tagaan Talaugon Tala Talatala Talongg Tiaoqui
      Tambuatco Tanhehco Tanjutco Tanjuatco Tansiongco Tapalla Tiangco Tiongson Tubog
      Tubongbanua Tugonon Tagonon Tumulakg Tupas Tupaz Tupa Quiblat Quisumbing
      Quindipan Quibin Quibuyen Uy Uytengsu Uysiuseng Vital Vitug Vivas Yengko
      Yaptinchay Yapchulay Yu
    ]

    SPANISH_SURNAMES = k %w[
      Abad Abella Abracosa Acevedo Acebedo Acosta Acuesta africa Aguilar Agustin
      Alba Alcantara Alcantar Alconcel Alicante Alcazar Alcaraz Alferez Alejandro
      Alonzo alvarez Ambriz Ancheta Aquino Arabejo Arboleda Arce Arcilla Armas
      Arrogante Artesano Asuncion Austria Ayala Azarcon Balandra Barcelona Barrameda
      Barerra Barreto Barrientos Bautista Belleza Bello Belloso Belmonte Benavides
      Benitez Bermudo Bernal Blanco Borja Borje Buenaflor Buenaventura Buenconsejo
      Buendia Buenpacifico Bustamante Cabrales Cabrera Cadiz Canencia Cantillo
      Cachuela Capistrano Carrasco Castillo Castro Castañares Cayetano Celis Ceniza
      Cereza Cerezo Cerinza Cervantes Chavez Concepcion Corporal Corpuz Cordoba
      Cordova Cuenca Custodio Cruz Cuenca Cueva Cuevas Dantes del Castillo de_la_Cruz
      de_la_Torre Torre de_Leon de_Leon de_los_Reyes Desiderio Despujol Diaz
      Divinagracia Domingo Dominguez Dulce Dueñaz Dueñas Elefante Elizalde Ello Ereve
      Escalante Escaño Escribano España Espejo Estillore Estrada Estrella Eusebio
      Evangelista Fajardo Fandiño Fernandez Flores Fontanilla Francisco Garay Galindez
      Galendez Galvez Gierran Garcia Gil Gomez Gonzales Gonzalez Gonzaga Goyena Guerra
      Guevarra Guevara Gutierrez Hermano Hernandez Hernando Herrera Hinojosa Hojas
      Hontiveros Ignacio Inarez Infante Infanta Inserto Ira Isidro Jabillo Jacinto
      Javier Jimenez Labrador Lara Laranang Laurel Lavares Lazaro Legaspi Legazpi
      Lindo Lorenzo Lopez Luz Madrid Madrigal Magallanes Magno Marcelo Matias Malano
      Manrique Manjon Mariano Martinez Marquez Manzano Medel Mencion Mendez Mendoza
      Mercado Mercadejas Mesias Miedes Mineque Mipa Miranda Monceda Montecillo
      Monteloyola Montenegro Monteverde de Monteverde Monzon Moreno Muñoz Murcia
      Murcialego Nallos Nañez Nañes Núñez Natural Naval Navarro Navidad Natividad
      Nievez Ocampo Olaguer Olarte Orante Ordenes Opulencia Osorio Padilla Palmones
      Paloma Pante Pastor Patajo de_la_Paz Paz Pelayo Perez Pilota Pelota Pizarro
      Pojas Ponferrada Portugal Quema Quezada Querubin Ramientos Razon Ramirez Ramos
      Recio Recto Relleve Reyes Reoja Rioja Rivera Riego Rodriguez Romero Roncesvalles
      Roque Rosario Rosales Roxas Rojas Ruedas Salazar Salvador Santillan Santos
      Sarmiento Segismundo Sigismundo Silvestre Soleminio Subijano Suelto Tejada
      Tolosa Torrealba Torres Valle Vargas Veterano Velasco Ventura Verano Villaecija
      Vicente Villamar Villamor Villanueva Villaroman Villegas Villosillo Vizcaya
      Yllana Zacarias Zafra Zamora
    ].map { |s| s.gsub('_', ' ') }
  end
end
