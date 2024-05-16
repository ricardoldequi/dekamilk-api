class Animal < ApplicationRecord
  self.table_name = "animal"
  belongs_to :raca, foreign_key: "raca_id", class_name: "Raca"
  has_many :vacinacao, class_name: "Calendariovacinacao", foreign_key: "animal_id"

end
