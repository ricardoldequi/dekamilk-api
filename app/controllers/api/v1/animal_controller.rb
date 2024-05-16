module Api
  module V1
    class AnimalController < ApplicationController
      before_action :set_animal, only: %i[ show update destroy ]

      # GET /animal
      def index
        @animal = Animal.all

        render json: @animal
      end

      # GET /animal/1
      def show
        render json: @animal
      end

      # POST /animal
      def create
        @animal = Animal.new(animal_params)

        if @animal.save
          render json: @animal, status: :created, location:api_v1_animal_url(@animal)
        else
          render json: @animal.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /animal/1
      def update
        if @animal.update(animal_params)
          render json: @animal
        else
          render json: @animal.errors, status: :unprocessable_entity
        end
      end

      # DELETE /animal/1
      def destroy
        @animal.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_animal
          @animal = Animal.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def animal_params
          params.require(:animal).permit(:raca_id, :nr_brinco, :idade, :data_nasc, :apelido, :nome_pai, :nome_mae, :is_inseminada, :is_lactante, :numero_crias, :peso, :sexo, :data_ult_cria)
        end
    end
  end
end