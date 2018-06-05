class Despesa < ApplicationRecord
  belongs_to :descricao_tipo
  
  # Cria validação
  validates  :data, :natureza,   :presence => true
  validates :valor, numericality: true
end
