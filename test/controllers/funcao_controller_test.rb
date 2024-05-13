require "test_helper"

class FuncaoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funcao = funcao(:one)
  end

  test "should get index" do
    get funcao_url, as: :json
    assert_response :success
  end

  test "should create funcao" do
    assert_difference("Funcao.count") do
      post funcao_url, params: { funcao: { funcao_id: @funcao.funcao_id, nome: @funcao.nome } }, as: :json
    end

    assert_response :created
  end

  test "should show funcao" do
    get funcao_url(@funcao), as: :json
    assert_response :success
  end

  test "should update funcao" do
    patch funcao_url(@funcao), params: { funcao: { funcao_id: @funcao.funcao_id, nome: @funcao.nome } }, as: :json
    assert_response :success
  end

  test "should destroy funcao" do
    assert_difference("Funcao.count", -1) do
      delete funcao_url(@funcao), as: :json
    end

    assert_response :no_content
  end
end
