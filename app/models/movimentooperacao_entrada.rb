class MovimentooperacaoEntrada < ApplicationRecord
    self.table_name = "movimento_operacao_e"
    belongs_to :operacao, foreign_key: :operacao_id
    belongs_to :fornecedor, optional: true
    belongs_to :cliente, optional: true
end
