class CreateReceitaARecebers < ActiveRecord::Migration[5.0]
  def change
    create_table :receita_a_recebers do |t|
      t.decimal :valor
      t.date :data
      t.string :natureza
      t.boolean :ativo
      t.datetime :data_inclusao
      t.datetime :data_alteracao
      t.references :apartamento, foreign_key: true
      t.references :descricao_tipo, foreign_key: true
      t.references :morador, foreign_key: true

      t.timestamps
    end
  end
end
