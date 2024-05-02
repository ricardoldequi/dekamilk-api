module Api
  module V1
    class UsuarioController < ApplicationController
      before_action :set_usuario, only: %i[ show update destroy ]

      # GET /usuario
      def index
        @usuario = Usuario.all

        render json: @usuario
      end

      # GET /usuario/1
      def show
        render json: @usuario
      end

      # POST /usuario
      def create
        @usuario = Usuario.new(usuario_params)

        if @usuario.save
          render json: @usuario, status: :created, location: api_v1_usuario_url(@usuario)
        else
          render json: @usuario.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /usuario/1
      def update
        if @usuario.update(usuario_params)
          render json: @usuario
        else
          render json: @usuario.errors, status: :unprocessable_entity
        end
      end

      # DELETE /usuario/1
      def destroy
        @usuario.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_usuario
          @usuario = Usuario.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def usuario_params
          params.require(:usuario).permit(:nome_usuario, :senha_usuario, :cpf, :email, :funcao, :telefone)
        end
    end
  end
end
