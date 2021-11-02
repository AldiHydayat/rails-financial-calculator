class CalculatorsController < ApplicationController
    def index
        @periode_list = [3, 6, 12, 24, 36, 48, 60]
    end

    def create
        @periode_list = [3, 6, 12, 24, 36, 48, 60]

        @target = params[:target].to_i
        @periode = params[:periode].to_i
        @awal = params[:awal].to_i
        @setoran = params[:setoran].to_i
        @tanggal_buka = Date.today
        @saldo_akhir = @awal
        @biaya_admin = 5000
        
        @hasil = []
        
        for i in 0..(@periode.to_i - 1) do
            
            if i == 0
                @bunga = Calculator.hitung_bunga(@awal, @periode)
                @pajak_bunga = Calculator.pajak_bunga(@bunga)
                @saldo_akhir = Calculator.hitung_saldo_akhir(@saldo_akhir, @bunga, @pajak_bunga, @biaya_admin)

                @hasil.push(["bulan" => @tanggal_buka.strftime("%B %Y"), "saldo" => @awal , "setoran" => 0 ,"bunga" => @bunga, "pajak_bunga" => @pajak_bunga, "biaya_admin" => @biaya_admin, "saldo_akhir" => @saldo_akhir ])

            elsif @saldo_akhir < @target

                @saldo = @saldo_akhir + @setoran
                @bunga = Calculator.hitung_bunga(@saldo_akhir, @periode)
                @pajak_bunga = Calculator.pajak_bunga(@bunga)
                @total_saldo_akhir = Calculator.hitung_saldo_akhir(@saldo, @bunga, @pajak_bunga, @biaya_admin)

                @hasil.push(["bulan" => (@tanggal_buka + i.month).strftime("%B %Y"), "saldo" => @saldo_akhir , "setoran" => @setoran,"bunga" => @bunga, "pajak_bunga" => @pajak_bunga, "biaya_admin" => @biaya_admin, "saldo_akhir" => @total_saldo_akhir ])

                @saldo_akhir = @total_saldo_akhir
            else
                false
            end
        end
        render 'index'
    end
end
