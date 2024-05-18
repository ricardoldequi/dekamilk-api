module Api
  module V1
    class RacaController < ApplicationController
      before_action :authorize
      before_action :set_raca, only: %i[ show update destroy ]

      # GET /raca
      def index
        @raca = Raca.all

        render json: @raca
      end

      # GET /raca/1
      def show
        render json: @raca
      end

      # POST /raca
      def create
        @raca = Raca.new(raca_params)

        if @raca.save
          render json: @raca, status: :created, location: api_v1_raca_url(@raca) 
        else
          render json: @raca.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /raca/1
      def update
        if @raca.update(raca_params)
          render json: @raca
        else
          render json: @raca.errors, status: :unprocessable_entity
        end
      end

      # DELETE /raca/1
      def destroy
        @raca.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_raca
          @raca = Raca.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def raca_params
          params.require(:raca).permit(:nome)
        end
    end
  end
end
