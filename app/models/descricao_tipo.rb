class DescricaoTipo < ApplicationRecord
  has_many :despesa
  has_many :receita_a_receber 
end
