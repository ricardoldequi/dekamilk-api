require "test_helper"

class AnimalControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animal = animal(:one)
  end

  test "should get index" do
    get animal_url, as: :json
    assert_response :success
  end

  test "should create animal" do
    assert_difference("Animal.count") do
      post animal_url, params: { animal: { animal_id: @animal.animal_id, apelido: @animal.apelido, data_nasc: @animal.data_nasc, data_ult_cria: @animal.data_ult_cria, idade: @animal.idade, is_inseminada: @animal.is_inseminada, is_lactante: @animal.is_lactante, nome_mae: @animal.nome_mae, nome_pai: @animal.nome_pai, nr_brinco: @animal.nr_brinco, numero_crias: @animal.numero_crias, peso: @animal.peso, raca_id_id: @animal.raca_id_id, sexo: @animal.sexo } }, as: :json
    end

    assert_response :created
  end

  test "should show animal" do
    get animal_url(@animal), as: :json
    assert_response :success
  end

  test "should update animal" do
    patch animal_url(@animal), params: { animal: { animal_id: @animal.animal_id, apelido: @animal.apelido, data_nasc: @animal.data_nasc, data_ult_cria: @animal.data_ult_cria, idade: @animal.idade, is_inseminada: @animal.is_inseminada, is_lactante: @animal.is_lactante, nome_mae: @animal.nome_mae, nome_pai: @animal.nome_pai, nr_brinco: @animal.nr_brinco, numero_crias: @animal.numero_crias, peso: @animal.peso, raca_id_id: @animal.raca_id_id, sexo: @animal.sexo } }, as: :json
    assert_response :success
  end

  test "should destroy animal" do
    assert_difference("Animal.count", -1) do
      delete animal_url(@animal), as: :json
    end

    assert_response :no_content
  end
end
