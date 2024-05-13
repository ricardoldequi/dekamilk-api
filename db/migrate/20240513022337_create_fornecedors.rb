class CreateFornecedors < ActiveRecord::Migration[7.1]
  def change
    create_table :fornecedors do |t|
      t.string :nome
      t.string :cpf
      t.string :cep
      t.string :cnpj
      t.string :endereco
      t.string :cidade
      t.string :bairro
      t.string :uf
      t.string :telefone
      t.string :telefone_fixo
      t.string :email

      t.timestamps
    end
  end
end
