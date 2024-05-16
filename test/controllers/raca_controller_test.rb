require "test_helper"

class RacaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raca = raca(:one)
  end

  test "should get index" do
    get raca_url, as: :json
    assert_response :success
  end

  test "should create raca" do
    assert_difference("Raca.count") do
      post raca_url, params: { raca: { nome: @raca.nome } }, as: :json
    end

    assert_response :created
  end

  test "should show raca" do
    get raca_url(@raca), as: :json
    assert_response :success
  end

  test "should update raca" do
    patch raca_url(@raca), params: { raca: { nome: @raca.nome } }, as: :json
    assert_response :success
  end

  test "should destroy raca" do
    assert_difference("Raca.count", -1) do
      delete raca_url(@raca), as: :json
    end

    assert_response :no_content
  end
end
