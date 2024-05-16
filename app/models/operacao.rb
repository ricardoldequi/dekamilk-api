class Operacao < ApplicationRecord
    self.table_name = "operacao"
    has_many :movimentos, class_name: "Movimento", foreign_key: "operacao_id"
end
