class CreateApartamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :apartamentos do |t|
      t.string :unidade
      t.boolean :ativo
      t.datetime :data_inclusao
      t.datetime :data_alteracao
      t.references :condominio, foreign_key: true

      t.timestamps
    end
  end
end
