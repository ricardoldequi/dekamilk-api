module Api
  module V1
    class VacinaController < ApplicationController
      before_action :set_vacina, only: %i[ show update destroy ]

      # GET /vacina
      def index
        @vacina = Vacina.all

        render json: @vacina
      end

      # GET /vacina/1
      def show
        render json: @vacina
      end

      # POST /vacina
      def create
        @vacina = Vacina.new(vacina_params)

        if @vacina.save
          render json: @vacina, status: :created, location: api_v1_vacina_url(@vacina)
        else
          render json: @vacina.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /vacina/1
      def update
        if @vacina.update(vacina_params)
          render json: @vacina
        else
          render json: @vacina.errors, status: :unprocessable_entity
        end
      end

      # DELETE /vacina/1
      def destroy
        @vacina.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_vacina
          @vacina = Vacina.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def vacina_params
          params.require(:vacina).permit(:nome_comercial, :nome_doenca, :principio_ativo, :tempo_previso, :tipo_aplicacao)
        end
    end
  end
end