module Api
  module V1
    class PrecounitariolitroController < ApplicationController
      before_action :authorize
      before_action :set_precounitariolitro, only: %i[ show update destroy ]

      # GET /precounitariolitro
      def index
        @precounitariolitro = Precounitariolitro.all

        render json: @precounitariolitro
      end

      # GET /precounitariolitro/1
      def show
        render json: @precounitariolitro
      end

      # POST /precounitariolitro
      def create
        @precounitariolitro = Precounitariolitro.new(precounitariolitro_params)

        if @precounitariolitro.save
          render json: @precounitariolitro, status: :created, location:api_v1_precounitariolitro_url(@precounitariolitro)
        else
          render json: @precounitariolitro.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /precounitariolitro/1
      def update
        if @precounitariolitro.update(precounitariolitro_params)
          render json: @precounitariolitro
        else
          render json: @precounitariolitro.errors, status: :unprocessable_entity
        end
      end

      # DELETE /precounitariolitro/1
      def destroy
        @precounitariolitro.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_precounitariolitro
          @precounitariolitro = Precounitariolitro.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def precounitariolitro_params
          params.require(:precounitariolitro).permit( :valor_unitario, :data_preco, :cliente_id)
        end
    end
  end
end
