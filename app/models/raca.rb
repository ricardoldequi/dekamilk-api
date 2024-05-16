class Raca < ApplicationRecord
    self.table_name = "raca"
    has_many :animais, class_name: "Animal", foreign_key: "raca_id"
end
