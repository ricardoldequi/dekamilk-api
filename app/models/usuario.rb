class Usuario < ApplicationRecord
    has_secure_password
    self.table_name = "usuario"
    belongs_to :funcao,  foreign_key: "funcao_id", class_name: "Funcao"
end
