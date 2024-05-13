require "test_helper"

class FornecedorControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fornecedor = fornecedor(:one)
  end

  test "should get index" do
    get fornecedor_url, as: :json
    assert_response :success
  end

  test "should create fornecedor" do
    assert_difference("Fornecedor.count") do
      post fornecedor_url, params: { fornecedor: { bairro: @fornecedor.bairro, cep: @fornecedor.cep, cidade: @fornecedor.cidade, cnpj: @fornecedor.cnpj, cpf: @fornecedor.cpf, email: @fornecedor.email, endereco: @fornecedor.endereco, nome: @fornecedor.nome, telefone: @fornecedor.telefone, telefone_fixo: @fornecedor.telefone_fixo, uf: @fornecedor.uf } }, as: :json
    end

    assert_response :created
  end

  test "should show fornecedor" do
    get fornecedor_url(@fornecedor), as: :json
    assert_response :success
  end

  test "should update fornecedor" do
    patch fornecedor_url(@fornecedor), params: { fornecedor: { bairro: @fornecedor.bairro, cep: @fornecedor.cep, cidade: @fornecedor.cidade, cnpj: @fornecedor.cnpj, cpf: @fornecedor.cpf, email: @fornecedor.email, endereco: @fornecedor.endereco, nome: @fornecedor.nome, telefone: @fornecedor.telefone, telefone_fixo: @fornecedor.telefone_fixo, uf: @fornecedor.uf } }, as: :json
    assert_response :success
  end

  test "should destroy fornecedor" do
    assert_difference("Fornecedor.count", -1) do
      delete fornecedor_url(@fornecedor), as: :json
    end

    assert_response :no_content
  end
end
