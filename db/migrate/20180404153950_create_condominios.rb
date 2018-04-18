class CreateCondominios < ActiveRecord::Migration[5.0]
  def change
    create_table :condominios do |t|
      t.decimal :saldo
      t.decimal :fundo_reserva

      t.timestamps
    end
  end
end
