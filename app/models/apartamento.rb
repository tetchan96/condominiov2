class Apartamento < ApplicationRecord
  belongs_to :condominio
  has_many :veiculo
  has_many :funcionario
  has_many :morador
  has_many :receita_a_receber
end
