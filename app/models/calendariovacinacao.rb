class Calendariovacinacao < ApplicationRecord
  self.table_name = "calendariovacinacao"

  belongs_to :animal, foreign_key: "animal_id", class_name: "Animal"
  belongs_to :vacina, foreign_key: "vacina_id", class_name: "Vacina"
end
