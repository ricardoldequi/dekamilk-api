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
        # Use callbacks to share common setup or constraints between actions.
        def set_movimento
          @movimento = Movimento.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def movimento_params
          params.require(:movimento).permit(:operacao_id, :quantidade, :fornecedor_id, :cliente_id, :descricao, :data_lancamento)
        end
    end
  end
end
