require "test_helper"

class VacinaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacina = vacina(:one)
  end

  test "should get index" do
    get vacina_url, as: :json
    assert_response :success
  end

  test "should create vacina" do
    assert_difference("Vacina.count") do
      post vacina_url, params: { vacina: { nome_comercial: @vacina.nome_comercial, nome_doenca: @vacina.nome_doenca, principio_ativo: @vacina.principio_ativo, tempo_previso: @vacina.tempo_previso, tipo_aplicacao: @vacina.tipo_aplicacao } }, as: :json
    end

    assert_response :created
  end

  test "should show vacina" do
    get vacina_url(@vacina), as: :json
    assert_response :success
  end

  test "should update vacina" do
    patch vacina_url(@vacina), params: { vacina: { nome_comercial: @vacina.nome_comercial, nome_doenca: @vacina.nome_doenca, principio_ativo: @vacina.principio_ativo, tempo_previso: @vacina.tempo_previso, tipo_aplicacao: @vacina.tipo_aplicacao } }, as: :json
    assert_response :success
  end

  test "should destroy vacina" do
    assert_difference("Vacina.count", -1) do
      delete vacina_url(@vacina), as: :json
    end

    assert_response :no_content
  end
end
