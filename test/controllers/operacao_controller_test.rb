require "test_helper"

class OperacaoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operacao = operacao(:one)
  end

  test "should get index" do
    get operacao_url, as: :json
    assert_response :success
  end

  test "should create operacao" do
    assert_difference("Operacao.count") do
      post operacao_url, params: { operacao: { descricao: @operacao.descricao, tipo: @operacao.tipo } }, as: :json
    end

    assert_response :created
  end

  test "should show operacao" do
    get operacao_url(@operacao), as: :json
    assert_response :success
  end

  test "should update operacao" do
    patch operacao_url(@operacao), params: { operacao: { descricao: @operacao.descricao, tipo: @operacao.tipo } }, as: :json
    assert_response :success
  end

  test "should destroy operacao" do
    assert_difference("Operacao.count", -1) do
      delete operacao_url(@operacao), as: :json
    end

    assert_response :no_content
  end
end
