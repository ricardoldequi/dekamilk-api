module Api
  module V1
    class ClienteController < ApplicationController
      before_action :authorize
      before_action :set_cliente, only: %i[ show update destroy ]

      # GET /cliente
      def index
        @cliente = Cliente.all

        render json: @cliente
      end

      # GET /cliente/1
      def show
        render json: @cliente
      end

      # POST /cliente
      def create
        @cliente = Cliente.new(cliente_params)

        if @cliente.save
          render json: @cliente, status: :created, location: api_v1_cliente_url(@cliente)
        else
          render json: @cliente.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /cliente/1
      def update
        if @cliente.update(cliente_params)
          render json: @cliente
        else
          render json: @cliente.errors, status: :unprocessable_entity
        end
      end

      # DELETE /cliente/1
      def destroy
        @cliente.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_cliente
          @cliente = Cliente.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def cliente_params
          params.require(:cliente).permit(:nome, :cpf, :cep, :cnpj, :endereco, :cidade, :bairro, :uf, :telefone, :telefone_fixo, :email)
        end
    end
  end
end