class AddNomeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :condominios, :nome, :string
  end
end
