class CreateDespesas < ActiveRecord::Migration[5.0]
  def change
    create_table :despesas do |t|
      t.date :data
      t.decimal :valor
      t.string :natureza
      t.boolean :ativo
      t.datetime :data_inclusao
      t.datetime :data_alteracao
      t.references :descricao_tipo, foreign_key: true

      t.timestamps
    end
  end
end
