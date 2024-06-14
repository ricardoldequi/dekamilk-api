module Api
  module V1
    class CalendariovacinacaoController < ApplicationController
      before_action :authorize
      before_action :set_calendariovacinacao, only: %i[ show update destroy ]

      # GET /calendariovacinacao
      def index
        @calendariovacinacao = Calendariovacinacao.all

        render json: @calendariovacinacao
      end

      # GET /calendariovacinacao/1
      def show
        render json: @calendariovacinacao
      end

      # POST /calendariovacinacao
      def create
        @calendariovacinacao = Calendariovacinacao.new(calendariovacinacao_params)

        if @calendariovacinacao.save
          render json: @calendariovacinacao, status: :created, location: api_v1_calendariovacinacao_url(@calendariovacinacao)
        else
          render json: @calendariovacinacao.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /calendariovacinacao/1
      def update
        if @calendariovacinacao.update(calendariovacinacao_params)
          render json: @calendariovacinacao
        else
          render json: @calendariovacinacao.errors, status: :unprocessable_entity
        end
      end

      # DELETE /calendariovacinacao/1
      def destroy
        @calendariovacinacao.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_calendariovacinacao
          @calendariovacinacao = Calendariovacinacao.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def calendariovacinacao_params
          params.require(:calendariovacinacao).permit(:animal_id, :vacina_id, :data_vacinacao, :tempo_carencia, :data_prevista_proxima_vacinacao)
        end
    end
  end
end
