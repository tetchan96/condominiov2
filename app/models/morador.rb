class Morador < ApplicationRecord
  belongs_to :apartamento
  has_many :receita_a_receber
end
