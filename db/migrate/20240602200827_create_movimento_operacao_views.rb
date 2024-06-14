class CreateMovimentoOperacaoViews < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW Movimento_Operacao_E AS
      SELECT m.*
      FROM Movimento m
      JOIN Operacao o ON m.operacao_id = o.operacao_id
      WHERE o.tipo = 'E';
    SQL

    execute <<-SQL
      CREATE OR REPLACE VIEW Movimento_Operacao_S AS
      SELECT m.*
      FROM Movimento m
      JOIN Operacao o ON m.operacao_id = o.operacao_id
      WHERE o.tipo = 'S';
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW IF EXISTS Movimento_Operacao_E;
    SQL

    execute <<-SQL
      DROP VIEW IF EXISTS Movimento_Operacao_S;
    SQL
  end
end
