class Vacina < ApplicationRecord
    self.table_name = "vacina"
    has_many :vacinacao, class_name: "Calendariovacinacao", foreign_key: "vacina_id"

end
