class Movimento < ApplicationRecord
  self.table_name = "movimento"
  belongs_to :operacao, foreign_key: "operacao_id", class_name: "Operacao"
  belongs_to :fornecedor, foreign_key: "fornecedor_id", class_name: "Fornecedor"
  belongs_to :cliente, foreign_key: "cliente_id", class_name: "Cliente"
end
