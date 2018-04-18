class CreateDescricaoTipos < ActiveRecord::Migration[5.0]
  def change
    create_table :descricao_tipos do |t|
      t.string :nome
      t.string :natureza
      t.decimal :valor_fixo
      t.boolean :ativo
      t.datetime :data_inclusao
      t.datetime :data_alteracao

      t.timestamps
    end
  end
end
