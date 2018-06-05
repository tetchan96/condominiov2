class DescricaoTipo < ApplicationRecord
  has_many :despesa
  has_many :receita_a_receber 
  
  # Cria validação
  validates  :nome, :presence => true
  validates :valor_fixo, numericality: true
end
