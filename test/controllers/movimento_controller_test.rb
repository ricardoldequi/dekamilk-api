require "test_helper"

class MovimentoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movimento = movimento(:one)
  end

  test "should get index" do
    get movimento_url, as: :json
    assert_response :success
  end

  test "should create movimento" do
    assert_difference("Movimento.count") do
      post movimento_url, params: { movimento: { cliente_id_id: @movimento.cliente_id_id, data_lancamento: @movimento.data_lancamento, descricao: @movimento.descricao, fornecedor_id_id: @movimento.fornecedor_id_id, movimento_id: @movimento.movimento_id, operacao_id_id: @movimento.operacao_id_id, quantidade: @movimento.quantidade } }, as: :json
    end

    assert_response :created
  end

  test "should show movimento" do
    get movimento_url(@movimento), as: :json
    assert_response :success
  end

  test "should update movimento" do
    patch movimento_url(@movimento), params: { movimento: { cliente_id_id: @movimento.cliente_id_id, data_lancamento: @movimento.data_lancamento, descricao: @movimento.descricao, fornecedor_id_id: @movimento.fornecedor_id_id, movimento_id: @movimento.movimento_id, operacao_id_id: @movimento.operacao_id_id, quantidade: @movimento.quantidade } }, as: :json
    assert_response :success
  end

  test "should destroy movimento" do
    assert_difference("Movimento.count", -1) do
      delete movimento_url(@movimento), as: :json
    end

    assert_response :no_content
  end
end
