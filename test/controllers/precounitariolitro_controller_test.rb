require "test_helper"

class PrecounitariolitroControllerTest < ActionDispatch::IntegrationTest
  setup do
    @precounitariolitro = precounitariolitro(:one)
  end

  test "should get index" do
    get precounitariolitro_url, as: :json
    assert_response :success
  end

  test "should create precounitariolitro" do
    assert_difference("Precounitariolitro.count") do
      post precounitariolitro_url, params: { precounitariolitro: { cliente_id_id: @precounitariolitro.cliente_id_id, data_preco: @precounitariolitro.data_preco, preco_unitario_litro_id: @precounitariolitro.preco_unitario_litro_id, valor_unitario: @precounitariolitro.valor_unitario } }, as: :json
    end

    assert_response :created
  end

  test "should show precounitariolitro" do
    get precounitariolitro_url(@precounitariolitro), as: :json
    assert_response :success
  end

  test "should update precounitariolitro" do
    patch precounitariolitro_url(@precounitariolitro), params: { precounitariolitro: { cliente_id_id: @precounitariolitro.cliente_id_id, data_preco: @precounitariolitro.data_preco, preco_unitario_litro_id: @precounitariolitro.preco_unitario_litro_id, valor_unitario: @precounitariolitro.valor_unitario } }, as: :json
    assert_response :success
  end

  test "should destroy precounitariolitro" do
    assert_difference("Precounitariolitro.count", -1) do
      delete precounitariolitro_url(@precounitariolitro), as: :json
    end

    assert_response :no_content
  end
end
