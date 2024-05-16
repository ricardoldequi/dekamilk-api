class Cliente < ApplicationRecord
    self.table_name = "cliente"
    has_many :precoUnitario, class_name: "PrecoUnitarioLitro", foreign_key: "cliente_id"
    has_many :movimentos, class_name: "Movimento", foreign_key: "cliente_id"

end
