module Api
  module V1
    class UsuarioController < ApplicationController
      wrap_parameters :usuario, include: [:password, :password_confirmation]
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
          token = encode_token({usuario_id: @usuario.id})
          render json: {usuario: @usuario, token: token}, status: :created, location: api_v1_usuario_url(@usuario)
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
      
      def login
        @usuario = Usuario.find_by(nome_usuario: params[:nome_usuario])
        if @usuario && @usuario.authenticate(params[:password])
          token = encode_token({usuario_id: @usuario.id})
         # puts "Token Gerado: #{token}" 
          render json: {usuario: @usuario, token: token}, status: :ok
        else
          render json: {error: 'Usuário ou senha inválidos'}, status: :unauthorized
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_usuario
          @usuario = Usuario.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def usuario_params
          params.permit(:nome_usuario, :password, :password_confirmation, :cpf, :email, :funcao_id, :telefone)

        end
    end
  end
end
