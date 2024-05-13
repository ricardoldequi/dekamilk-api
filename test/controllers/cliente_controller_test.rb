require "test_helper"

class ClienteControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cliente = cliente(:one)
  end

  test "should get index" do
    get cliente_url, as: :json
    assert_response :success
  end

  test "should create cliente" do
    assert_difference("Cliente.count") do
      post cliente_url, params: { cliente: { bairro: @cliente.bairro, cep: @cliente.cep, cidade: @cliente.cidade, cnpj: @cliente.cnpj, cpf: @cliente.cpf, email: @cliente.email, endereco: @cliente.endereco, nome: @cliente.nome, telefone: @cliente.telefone, telefone_fixo: @cliente.telefone_fixo, uf: @cliente.uf } }, as: :json
    end

    assert_response :created
  end

  test "should show cliente" do
    get cliente_url(@cliente), as: :json
    assert_response :success
  end

  test "should update cliente" do
    patch cliente_url(@cliente), params: { cliente: { bairro: @cliente.bairro, cep: @cliente.cep, cidade: @cliente.cidade, cnpj: @cliente.cnpj, cpf: @cliente.cpf, email: @cliente.email, endereco: @cliente.endereco, nome: @cliente.nome, telefone: @cliente.telefone, telefone_fixo: @cliente.telefone_fixo, uf: @cliente.uf } }, as: :json
    assert_response :success
  end

  test "should destroy cliente" do
    assert_difference("Cliente.count", -1) do
      delete cliente_url(@cliente), as: :json
    end

    assert_response :no_content
  end
end
