class Veiculo < ApplicationRecord
  belongs_to :apartamento
  
  # Cria validação
  validates  :placa, :apartamento_id , :presence => true
end
