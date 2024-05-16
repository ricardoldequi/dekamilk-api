class Precounitariolitro < ApplicationRecord
  self.table_name = "precounitariolitro"
  belongs_to :cliente,  foreign_key: "cliente_id", class_name: "Cliente"
end
