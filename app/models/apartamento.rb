class Apartamento < ActiveRecord::Base
  belongs_to :condominio
  has_many :veiculo
  has_many :funcionario
  has_many :morador
  has_many :receita_a_receber
  
  # Cria validação
  validates  :unidade , :presence => true
end
