module Api
  module V1
    class MovimentoController < ApplicationController
      before_action :authorize
      before_action :set_movimento, only: %i[ show update destroy ]

      # GET /movimento
      def index
        @movimento = Movimento.all
        render json: @movimento
      end

      # GET /movimento/1
      def show
        render json: @movimento
      end

      # GET /movimento/entrada
      def entrada
        @movimento_entrada = MovimentooperacaoEntrada.all
        render json: @movimento_entrada
      end

      # GET /movimento/saida
      def saida
        @movimento_saida = MovimentooperacaoSaida.all
        render json: @movimento_saida
      end

      # GET /movimento/todos
      def todos
        @movimento_entrada = MovimentooperacaoEntrada.all
        @movimento_saida = MovimentooperacaoSaida.all
        @movimentos = {
          entrada: @movimento_entrada,
          saida: @movimento_saida
        }
        render json: @movimentos
      end

      # GET /movimento/relatorio
      def relatorio
        entradas = MovimentooperacaoEntrada.all
        saidas = MovimentooperacaoSaida.all

        saldo_entradas = entradas.sum(:quantidade)
        saldo_saidas = saidas.sum(:quantidade)
        saldo_total = saldo_entradas - saldo_saidas

        pdf = MovimentoReportService.new.generate_pdf(entradas, saidas, saldo_total)

        send_data pdf, filename: "relatorio_movimentos.pdf", type: "application/pdf", disposition: "inline"
      end

      # POST /movimento
      def create
        @movimento = Movimento.new(movimento_params)

        if @movimento.save
          render json: @movimento, status: :created, location: api_v1_movimento_url(@movimento)
        else
          render json: @movimento.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /movimento/1
      def update
        if @movimento.update(movimento_params)
          render json: @movimento
        else
          render json: @movimento.errors, status: :unprocessable_entity
        end
      end

      # DELETE /movimento/1
      def destroy
        @movimento.destroy!
      end

      private

      def set_movimento
        @movimento = Movimento.find(params[:id])
      end

      def movimento_params
        params.require(:movimento).permit(:operacao_id, :quantidade, :fornecedor_id, :cliente_id, :descricao, :data_lancamento)
      end
    end
  end
end
