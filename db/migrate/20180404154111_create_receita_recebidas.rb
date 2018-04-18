class CreateReceitaRecebidas < ActiveRecord::Migration[5.0]
  def change
    create_table :receita_recebidas do |t|
      t.decimal :valor
      t.date :data
      t.boolean :ativo
      t.datetime :data_inclusao
      t.datetime :data_alteracao
      t.references :receita_a_receber, foreign_key: true

      t.timestamps
    end
  end
end
