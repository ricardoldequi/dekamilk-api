module Api
  module V1
    class FuncaoController < ApplicationController
      before_action :set_funcao, only: %i[ show update destroy ]

      # GET /funcao
      def index
        @funcao = Funcao.all

        render json: @funcao
      end

      # GET /funcao/1
      def show
        render json: @funcao
      end

      # POST /funcao
      def create
        @funcao = Funcao.new(funcao_params)

        if @funcao.save
          render json: @funcao, status: :created, location: api_v1_funcao_url(@funcao)
        else
          render json: @funcao.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /funcao/1
      def update
        if @funcao.update(funcao_params)
          render json: @funcao
        else
          render json: @funcao.errors, status: :unprocessable_entity
        end
      end

      # DELETE /funcao/1
      def destroy
        @funcao.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_funcao
          @funcao = Funcao.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def funcao_params
          params.require(:funcao).permit(:funcao_id, :nome)
        end
      end
    end
end
