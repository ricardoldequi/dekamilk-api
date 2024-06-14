class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 'paocombanha')
    end

    def decode_token
        auth_header = request.headers['Authorization']
        return unless auth_header

        token = auth_header.split(' ').last
        begin
            JWT.decode(token, 'paocombanha', true, algorithm: 'HS256')
        rescue JWT::DecodeError
            nil
        end
    end

    def authorized_user
        decoded_token = decode_token
        if decoded_token
          usuario_id = decoded_token[0]['usuario_id']
          @usuario = Usuario.find_by(usuario_id:)
          return @usuario.present?
        end
        false
    end

    def authorize
        # puts "Authorization Header: #{request.headers['Authorization']}"
        # puts "Decoded Token: #{decode_token.inspect}"
        # puts "Authorized User: #{authorized_user.inspect}"
        render json: { message: 'Voce precisa estar logado para acessar essa pagina' }, status: :unauthorized unless authorized_user
    end
end
