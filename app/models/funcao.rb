class Funcao < ApplicationRecord
    self.table_name = "funcao"
    has_many :usuarios, class_name: "Usuario", foreign_key: "funcao_id"
  end