require "test_helper"

class CalendariovacinacaoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calendariovacinacao = calendariovacinacao(:one)
  end

  test "should get index" do
    get calendariovacinacao_url, as: :json
    assert_response :success
  end

  test "should create calendariovacinacao" do
    assert_difference("Calendariovacinacao.count") do
      post calendariovacinacao_url, params: { calendariovacinacao: { animal_id_id: @calendariovacinacao.animal_id_id, data_prevista_proxima_vacinacao: @calendariovacinacao.data_prevista_proxima_vacinacao, data_vacinacao: @calendariovacinacao.data_vacinacao, tempo_carencia: @calendariovacinacao.tempo_carencia, vacina_id_id: @calendariovacinacao.vacina_id_id, vacinacao_id: @calendariovacinacao.vacinacao_id } }, as: :json
    end

    assert_response :created
  end

  test "should show calendariovacinacao" do
    get calendariovacinacao_url(@calendariovacinacao), as: :json
    assert_response :success
  end

  test "should update calendariovacinacao" do
    patch calendariovacinacao_url(@calendariovacinacao), params: { calendariovacinacao: { animal_id_id: @calendariovacinacao.animal_id_id, data_prevista_proxima_vacinacao: @calendariovacinacao.data_prevista_proxima_vacinacao, data_vacinacao: @calendariovacinacao.data_vacinacao, tempo_carencia: @calendariovacinacao.tempo_carencia, vacina_id_id: @calendariovacinacao.vacina_id_id, vacinacao_id: @calendariovacinacao.vacinacao_id } }, as: :json
    assert_response :success
  end

  test "should destroy calendariovacinacao" do
    assert_difference("Calendariovacinacao.count", -1) do
      delete calendariovacinacao_url(@calendariovacinacao), as: :json
    end

    assert_response :no_content
  end
end
