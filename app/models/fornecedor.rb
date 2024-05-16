class Fornecedor < ApplicationRecord
    self.table_name = "fornecedor"
 has_many :movimentos, class_name: "Movimento", foreign_key: "fornecedor_id"

end
