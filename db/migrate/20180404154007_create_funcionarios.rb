class CreateFuncionarios < ActiveRecord::Migration[5.0]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :tel
      t.string :dias_autorizados
      t.boolean :ativo
      t.datetime :data_inclusao
      t.datetime :data_alteracao
      t.references :apartamento, foreign_key: true

      t.timestamps
    end
  end
end
