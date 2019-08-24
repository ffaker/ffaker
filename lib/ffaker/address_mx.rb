# frozen_string_literal: true

module FFaker
  module AddressMX
    extend ModuleUtils
    extend self

    def zip_code
      FFaker.numerify('#####')
    end

    def postal_code
      FFaker.numerify('#####')
    end

    def state
      fetch_sample(STATE)
    end

    def state_abbr(st_name = nil)
      st_name ||= state
      STATE_ABBR[STATE.index(st_name)]
    end

    def municipality(st_abbr = nil)
      st_abbr ||= state_abbr
      MUNICIPALITY[st_abbr][rand(0...MUNICIPALITY[st_abbr].size)]
    end

    MUNICIPALITY = { 'AGS' => AGS, 'BC' => BC, 'BCS' => BCS, 'CAMP' => CAMP, 'CHIS' => CHIS,
                     'CHIH' => CHIH, 'COAH' => COAH, 'COL' => COL, 'DF' => DF, 'DGO' => DGO, 'GRO' => GRO,
                     'GTO' => GTO, 'HGO' => HGO, 'JAL' => JAL, 'MEX' => MEX, 'MICH' => MICH, 'MOR' => MOR,
                     'NL' => NL, 'NAY' => NAY, 'OAX' => OAX, 'PUE' => PUE, 'QR' => QR, 'QRO' => QRO, 'SLP' => SLP,
                     'SIN' => SIN, 'SON' => SON, 'TAB' => TAB, 'TAMPS' => TAMPS, 'TLAX' => TLAX, 'VER' => VER,
                     'YUC' => YUC, 'ZAC' => ZAC }.freeze
  end
end
