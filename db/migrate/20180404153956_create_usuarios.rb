class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :login
      t.string :senha
      t.boolean :ativo
      t.datetime :data_inclusao
      t.datetime :data_alteracao
      t.references :condominio, foreign_key: true

      t.timestamps
    end
  end
end
