module Api
  module V1
    class OperacaoController < ApplicationController
      before_action :set_operacao, only: %i[ show update destroy ]

      # GET /operacao
      def index
        @operacao = Operacao.all

        render json: @operacao
      end

      # GET /operacao/1
      def show
        render json: @operacao
      end

      # POST /operacao
      def create
        @operacao = Operacao.new(operacao_params)

        if @operacao.save
          render json: @operacao, status: :created, location: api_v1_operacao_url(@operacao)

        else
          render json: @operacao.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /operacao/1
      def update
        if @operacao.update(operacao_params)
          render json: @operacao
        else
          render json: @operacao.errors, status: :unprocessable_entity
        end
      end

      # DELETE /operacao/1
      def destroy
        @operacao.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_operacao
          @operacao = Operacao.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def operacao_params
          params.require(:operacao).permit(:descricao, :tipo)
        end
    end
  end 
end