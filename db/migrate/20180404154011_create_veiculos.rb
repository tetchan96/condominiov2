+-class CreateVeiculos < ActiveRecord::Migration[5.0]
  def change
    create_table :veiculos do |t|
      t.string :marca
      t.string :modelo
      t.string :cor
      t.string :placa
      t.boolean :ativo
      t.datetime :data_inclusao
      t.datetime :data_alteracao
      t.references :apartamento, foreign_key: true

      t.timestamps
    end
  end
end
