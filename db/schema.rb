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

ActiveRecord::Schema[7.1].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal", primary_key: "animal_id", id: :serial, force: :cascade do |t|
    t.integer "raca_id", null: false
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

  create_table "calendariovacinacao", primary_key: "vacinacao_id", id: :serial, force: :cascade do |t|
    t.integer "animal_id", null: false
    t.integer "vacina_id", null: false
    t.date "data_vacinacao", null: false
    t.integer "tempo_carencia"
    t.date "data_prevista_proxima_vacinacao"
  end

  create_table "cliente", primary_key: "cliente_id", id: :serial, force: :cascade do |t|
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

  create_table "fornecedor", primary_key: "fornecedor_id", id: :serial, force: :cascade do |t|
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

  create_table "funcao", primary_key: "funcao_id", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 20, null: false
  end

  create_table "movimento", primary_key: "movimento_id", id: :serial, force: :cascade do |t|
    t.integer "operacao_id", null: false
    t.float "quantidade", null: false
    t.integer "fornecedor_id", null: false
    t.integer "cliente_id", null: false
    t.string "descricao", limit: 300, null: false
    t.datetime "data_lancamento", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "operacao", primary_key: "operacao_id", id: :serial, force: :cascade do |t|
    t.string "descricao", limit: 300, null: false
    t.string "tipo", limit: 1
    t.check_constraint "tipo = ANY (ARRAY['E'::bpchar, 'S'::bpchar, 'N'::bpchar])", name: "operacao_tipo_check"
  end

  create_table "precounitariolitro", primary_key: "preco_unitario_id", id: :serial, force: :cascade do |t|
    t.float "valor_unitario", default: 0.0, null: false
    t.date "data_preco", null: false
    t.integer "cliente_id", null: false
  end

  create_table "raca", primary_key: "raca_id", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 20, null: false
  end

  create_table "usuario", primary_key: "usuario_id", id: :serial, force: :cascade do |t|
    t.string "nome_usuario", limit: 60, null: false
    t.string "senha_usuario", limit: 20, null: false
    t.string "cpf", limit: 14, default: "000.000.000-00", null: false
    t.string "email", limit: 70
    t.integer "funcao_id", null: false
    t.string "telefone", limit: 15, default: "00 00000-0000"

    t.unique_constraint ["cpf"], name: "usuario_cpf_key"
    t.unique_constraint ["nome_usuario"], name: "usuario_nome_usuario_key"
  end

  create_table "vacina", primary_key: "vacina_id", id: :serial, force: :cascade do |t|
    t.string "nome_comercial", null: false
    t.string "nome_doenca"
    t.string "principio_ativo", null: false
    t.integer "tempo_previsto"
    t.string "tipo_aplicacao", null: false
  end

  add_foreign_key "animal", "raca", primary_key: "raca_id", name: "fk_raca_id"
  add_foreign_key "calendariovacinacao", "animal", primary_key: "animal_id", name: "fk_animal_id"
  add_foreign_key "calendariovacinacao", "vacina", primary_key: "vacina_id", name: "fk_vacina_id"
  add_foreign_key "movimento", "cliente", primary_key: "cliente_id", name: "fk_cliente_id"
  add_foreign_key "movimento", "fornecedor", primary_key: "fornecedor_id", name: "fk_fornecedor_id"
  add_foreign_key "precounitariolitro", "cliente", primary_key: "cliente_id", name: "fk_cliente_id"
  add_foreign_key "usuario", "funcao", primary_key: "funcao_id", name: "fk_funcao"
end
