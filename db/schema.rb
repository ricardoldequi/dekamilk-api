# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_02_010900) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal", primary_key: "id_animal", id: :serial, force: :cascade do |t|
    t.integer "id_raca", null: false
    t.integer "nr_brinco", null: false
    t.integer "idade"
    t.date "data_nasc"
    t.string "apelido", limit: 15, null: false
    t.string "nome_pai", limit: 15
    t.string "nome_mae", limit: 15
    t.boolean "inseminada", null: false
    t.boolean "is_lactante"
    t.integer "numero_crias"
    t.float "peso"
    t.string "sexo", limit: 1
    t.date "data_ult_cria"
    t.boolean "is_inseminada"
    t.check_constraint "sexo = ANY (ARRAY['M'::bpchar, 'F'::bpchar])", name: "animal_sexo_check"
  end

  create_table "calendariovacinacao", primary_key: "id_vacinacao", id: :serial, force: :cascade do |t|
    t.integer "id_animal", null: false
    t.integer "id_vacina", null: false
    t.date "data_vacinacao", null: false
    t.integer "tempo_carencia"
    t.date "data_prevista_proxima_vacinacao"
  end

  create_table "cliente", primary_key: "id_cliente", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 60, null: false
    t.string "cpf", limit: 14, null: false
    t.string "cep", limit: 9
    t.string "cnpj", limit: 14
    t.string "endereco", limit: 150
    t.string "cidade", limit: 70
    t.string "bairro", limit: 70
    t.string "uf", limit: 2
    t.string "telefone", limit: 20
    t.string "telefone_fixo", limit: 20
    t.string "email", limit: 70

    t.unique_constraint ["cpf"], name: "cliente_cpf_key"
  end

  create_table "fornecedor", primary_key: "id_fornecedor", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 60, null: false
    t.string "cpf", limit: 14, null: false
    t.string "cep", limit: 10
    t.string "cnpj", limit: 14
    t.string "endereco", limit: 150
    t.string "cidade", limit: 70
    t.string "bairro", limit: 70
    t.string "uf", limit: 2
    t.string "telefone", limit: 20
    t.string "telefone_fixo", limit: 20
    t.string "email", limit: 70

    t.unique_constraint ["cpf"], name: "fornecedor_cpf_key"
  end

  create_table "funcao", primary_key: "id_funcao", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 20, null: false
  end

  create_table "movimento", primary_key: "id_movimento", id: :serial, force: :cascade do |t|
    t.integer "id_operacao", null: false
    t.float "quantidade", null: false
    t.integer "id_fornecedor", null: false
    t.integer "id_cliente", null: false
    t.string "descricao", limit: 300, null: false
    t.datetime "data_lancamento", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "operacao", primary_key: "id_operacao", id: :serial, force: :cascade do |t|
    t.string "descricao", limit: 300, null: false
    t.string "tipo", limit: 1
    t.check_constraint "tipo = ANY (ARRAY['E'::bpchar, 'S'::bpchar, 'N'::bpchar])", name: "operacao_tipo_check"
  end

  create_table "precounitariolitro", primary_key: "id_preco_unitario", id: :serial, force: :cascade do |t|
    t.float "valor_unitario", default: 0.0, null: false
    t.date "data_preco", null: false
    t.integer "id_cliente", null: false
  end

  create_table "raca", primary_key: "id_raca", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 20, null: false
  end

  create_table "usuario", primary_key: "id_usuario", id: :serial, force: :cascade do |t|
    t.string "nome_usuario", limit: 60, null: false
    t.string "senha_usuario", limit: 20, null: false
    t.string "cpf", limit: 14, default: "000.000.000-00", null: false
    t.string "email", limit: 70
    t.integer "funcao", null: false
    t.string "telefone", limit: 15, default: "00 00000-0000"

    t.unique_constraint ["cpf"], name: "usuario_cpf_key"
    t.unique_constraint ["nome_usuario"], name: "usuario_nome_usuario_key"
    t.unique_constraint ["telefone"], name: "usuario_telefone_key"
  end


  create_table "vacina", primary_key: "id_vacina", id: :serial, force: :cascade do |t|
    t.string "nome_comercial", null: false
    t.string "nome_doenca"
    t.string "principio_ativo", null: false
    t.integer "tempo_previsto"
    t.string "tipo_aplicacao", null: false
  end

  add_foreign_key "animal", "raca", column: "id_raca", primary_key: "id_raca", name: "fk_id_raca"
  add_foreign_key "calendariovacinacao", "animal", column: "id_animal", primary_key: "id_animal", name: "fk_id_animal"
  add_foreign_key "calendariovacinacao", "vacina", column: "id_vacina", primary_key: "id_vacina", name: "fk_id_vacina"
  add_foreign_key "movimento", "cliente", column: "id_cliente", primary_key: "id_cliente", name: "fk_cliente"
  add_foreign_key "movimento", "fornecedor", column: "id_fornecedor", primary_key: "id_fornecedor", name: "fk_fornecedor"
  add_foreign_key "precounitariolitro", "cliente", column: "id_cliente", primary_key: "id_cliente", name: "fk_cliente"
  add_foreign_key "usuario", "funcao", column: "funcao", primary_key: "id_funcao", name: "fk_funcao"
end
