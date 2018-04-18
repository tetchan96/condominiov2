class CreateMoradors < ActiveRecord::Migration[5.0]
  def change
    create_table :moradors do |t|
      t.string :nome
      t.string :rg
      t.string :cpf
      t.string :tel_residencial
      t.string :tel_celular
      t.string :tel_comercial
      t.string :ramal
      t.string :email
      t.string :parentesco
      t.string :tipo
      t.boolean :ativo
      t.datetime :data_inclusao
      t.datetime :data_alteracao
      t.references :apartamento, foreign_key: true

      t.timestamps
    end
  end
end
