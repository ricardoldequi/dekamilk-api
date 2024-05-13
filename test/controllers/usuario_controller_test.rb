require "test_helper"

class UsuarioControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usuario = usuario(:one)
  end

  test "should get index" do
    get usuario_url, as: :json
    assert_response :success
  end

  test "should create usuario" do
    assert_difference("Usuario.count") do
      post usuario_url, params: { usuario: { cpf: @usuario.cpf, email: @usuario.email, funcao: @usuario.funcao_id, nome_usuario: @usuario.nome_usuario, senha_usuario: @usuario.senha_usuario, telefone: @usuario.telefone } }, as: :json
    end

    assert_response :created
  end

  test "should show usuario" do
    get usuario_url(@usuario), as: :json
    assert_response :success
  end

  test "should update usuario" do
    patch usuario_url(@usuario), params: { usuario: { cpf: @usuario.cpf, email: @usuario.email, funcao: @usuario.funcao, nome_usuario: @usuario.nome_usuario, senha_usuario: @usuario.senha_usuario, telefone: @usuario.telefone } }, as: :json
    assert_response :success
  end

  test "should destroy usuario" do
    assert_difference("Usuario.count", -1) do
      delete usuario_url(@usuario), as: :json
    end

    assert_response :no_content
  end
end
