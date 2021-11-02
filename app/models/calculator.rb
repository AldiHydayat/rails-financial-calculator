class Calculator < ApplicationRecord
    def self.set_data_kalkulasi(bulan:, saldo:, setoran:, bunga:, pajak_bunga:, biaya_admin:, saldo_akhir:)
        ["bulan" => bulan, "saldo" => saldo , "setoran" => setoran ,"bunga" => bunga, "pajak_bunga" => pajak_bunga, "biaya_admin" => biaya_admin, "saldo_akhir" => saldo_akhir ]
    end

    def self.hitung_saldo_akhir(saldo, bunga, pajak_bunga, biaya_admin)
        saldo + bunga - pajak_bunga - biaya_admin
    end

    def self.hitung_bunga(saldo_akhir, periode)
        tiga_persen = tiga_persen!(saldo_akhir)
        if periode < 12 
            (tiga_persen/12)*periode
        else 
            tiga_persen
        end
    end

    def self.pajak_bunga(bunga)
        (bunga/100)*20
    end

    def self.tiga_persen!(saldo)
        (saldo/100)*3
    end
end